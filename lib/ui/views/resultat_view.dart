import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../services/seed_service.dart';
import '../common/app_colors.dart';
import '../common/app_space.dart';
import '../shared_widgets/pressable_card.dart';

class ResultatView extends StatelessWidget {
  const ResultatView({
    super.key,
    required this.onBack,
    required this.onProductTap,
    required this.onViewRecommendations,
  });

  final VoidCallback onBack;
  final ValueChanged<Product> onProductTap;
  final VoidCallback onViewRecommendations;

  @override
  Widget build(BuildContext context) {
    final profile = SeedService.mockProfile;
    final topPicks = SeedService.products.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: onBack,
        ),
        title: const Text('Ditt resultat'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpace.screen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpace.xl),
              decoration: BoxDecoration(
                color: AppColors.softPink,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '${profile.matchScore}% match',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    profile.skinType,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    profile.undertone,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpace.section),
            Text('Dina behov', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpace.lg),
            Wrap(
              spacing: AppSpace.sm,
              runSpacing: AppSpace.sm,
              children: profile.concerns
                  .map(
                    (c) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpace.lg,
                        vertical: AppSpace.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blush.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(c,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: AppSpace.section),
            Text(
              'Toppval för dig',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpace.lg),
            ...topPicks.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpace.lg),
                child: PressableCard(
                  onTap: () => onProductTap(p),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          p.imageAsset,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppSpace.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.name,
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(
                              p.matchReason,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right,
                          color: AppColors.hover, size: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpace.lg),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: onViewRecommendations,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: Text(
                      'Se alla rekommendationer',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.cream,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
