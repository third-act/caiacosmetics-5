import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../services/seed_service.dart';
import '../common/app_colors.dart';
import '../common/app_space.dart';
import '../common/app_theme.dart';
import '../shared_widgets/pressable_card.dart';

class ForDigView extends StatelessWidget {
  const ForDigView({
    super.key,
    required this.onProductTap,
  });

  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    final products = SeedService.products;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: AppTheme.tabContentPadding().copyWith(
              top: AppSpace.section,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('För dig', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Baserat på din hudprofil — ${SeedService.mockProfile.skinType}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpace.section),
                _MatchBanner(),
                const SizedBox(height: AppSpace.section),
                Text(
                  'Rekommendationer',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.lg),
                ...products.map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.lg),
                    child: _RecommendationCard(
                      product: p,
                      onTap: () => onProductTap(p),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpace.xl),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MatchBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = SeedService.mockProfile;
    return PressableCard(
      backgroundColor: AppColors.softPink,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                '${profile.matchScore}%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
        ],
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpace.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.imageAsset,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.2,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  product.matchReason,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  '${product.priceKr} KR',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
