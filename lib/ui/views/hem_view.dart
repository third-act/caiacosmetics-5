import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../services/seed_service.dart';
import '../common/app_colors.dart';
import '../common/app_shadows.dart';
import '../common/app_space.dart';
import '../common/app_theme.dart';
import '../shared_widgets/pressable_card.dart';

class HemView extends StatelessWidget {
  const HemView({
    super.key,
    required this.onStartScan,
    required this.onProductTap,
    required this.onGoToHudscan,
  });

  final VoidCallback onStartScan;
  final ValueChanged<Product> onProductTap;
  final VoidCallback onGoToHudscan;

  @override
  Widget build(BuildContext context) {
    final recommended = SeedService.products.take(2).toList();

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
                Text(
                  'Hej, välkommen tillbaka',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Skanna ansiktet — få produkter som passar din hud',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: AppSpace.section),
                _HeroScanCard(
                  onStartScan: onStartScan,
                  onGoToHudscan: onGoToHudscan,
                ),
                const SizedBox(height: AppSpace.section),
                Text(
                  'Rekommenderat för dig',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.lg),
                ...recommended.map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.lg),
                    child: _ProductRow(
                      product: p,
                      onTap: () => onProductTap(p),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Accent-owned surface — soft gradient glow plate (only one in app).
class _HeroScanCard extends StatelessWidget {
  const _HeroScanCard({
    required this.onStartScan,
    required this.onGoToHudscan,
  });

  final VoidCallback onStartScan;
  final VoidCallback onGoToHudscan;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blush.withValues(alpha: 0.55),
            AppColors.softPink,
            AppColors.cream,
          ],
        ),
        boxShadow: AppShadows.glow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -10,
              child: Image.asset(
                'assets/images/hero_scan.jpg',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.85),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpace.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.md,
                      vertical: AppSpace.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cream.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Hudscan',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpace.lg),
                  Text(
                    'Scanna ansiktet',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    'Få rekommendationer på makeup och hudvård\nanpassade efter din hudtyp.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpace.xl),
                  Row(
                    children: [
                      _CtaButton(
                        label: 'Starta scan',
                        filled: true,
                        onTap: onStartScan,
                      ),
                      const SizedBox(width: AppSpace.md),
                      _CtaButton(
                        label: 'Läs mer',
                        filled: false,
                        onTap: onGoToHudscan,
                      ),
                    ],
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

class _CtaButton extends StatelessWidget {
  const _CtaButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.xl,
          vertical: AppSpace.md,
        ),
        decoration: BoxDecoration(
          color: filled ? AppColors.ink : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: filled
              ? null
              : Border.all(color: AppColors.ink.withValues(alpha: 0.25)),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: filled ? AppColors.cream : AppColors.ink,
              ),
        ),
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  const _ProductRow({required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.imageAsset,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSpace.lg),
          Expanded(
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
                Text(product.name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpace.xs),
                Text(
                  '${product.priceKr} KR',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.hover, size: 20),
        ],
      ),
    );
  }
}
