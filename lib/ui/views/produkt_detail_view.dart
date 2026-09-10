import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../common/app_colors.dart';
import '../common/app_space.dart';
import '../shared_widgets/pressable_card.dart';

class ProduktDetailView extends StatelessWidget {
  const ProduktDetailView({
    super.key,
    required this.product,
    required this.onBack,
  });

  final Product product;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: onBack,
        ),
        title: Text(product.category),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                product.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpace.screen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.isNew)
                    Text(
                      'Nyhet',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.sale,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    '${product.priceKr} KR',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: AppSpace.section),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  if (product.matchReason.isNotEmpty) ...[
                    const SizedBox(height: AppSpace.section),
                    PressableCard(
                      backgroundColor: AppColors.softPink,
                      child: Row(
                        children: [
                          const Icon(Icons.verified_outlined,
                              color: AppColors.ink, size: 22),
                          const SizedBox(width: AppSpace.lg),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Passar din hud',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  product.matchReason,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpace.section),
                  SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: AppSpace.lg),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Center(
                          child: Text(
                            'Lägg till',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
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
          ],
        ),
      ),
    );
  }
}
