import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_shadows.dart';
import '../common/app_space.dart';
import '../common/app_theme.dart';
import '../shared_widgets/pressable_card.dart';

class HudscanView extends StatelessWidget {
  const HudscanView({
    super.key,
    required this.onStartScan,
    required this.onViewResult,
  });

  final VoidCallback onStartScan;
  final VoidCallback onViewResult;

  @override
  Widget build(BuildContext context) {
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
                Text('Hudscan', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Ansiktsscan → hudanalys → personliga rekommendationer',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpace.section),
                _ScanSurface(onStartScan: onStartScan),
                const SizedBox(height: AppSpace.section),
                Text(
                  'Så fungerar det',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.lg),
                const _StepRow(
                  step: '1',
                  title: 'Scanna ansiktet',
                  body: 'Rikta kameran mot ansiktet i bra ljus.',
                ),
                const SizedBox(height: AppSpace.md),
                const _StepRow(
                  step: '2',
                  title: 'Se ditt resultat',
                  body: 'Vi analyserar hudtyp, underton och behov.',
                ),
                const SizedBox(height: AppSpace.md),
                const _StepRow(
                  step: '3',
                  title: 'Få rekommendationer',
                  body: 'Produkter från makeup och hudvård som passar dig.',
                ),
                const SizedBox(height: AppSpace.section),
                PressableCard(
                  onTap: onViewResult,
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.blush.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.insights_outlined,
                            color: AppColors.ink),
                      ),
                      const SizedBox(width: AppSpace.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Se senaste resultat',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Mock: din hudprofil från senaste scan',
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanSurface extends StatelessWidget {
  const _ScanSurface({required this.onStartScan});

  final VoidCallback onStartScan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.card,
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.blush,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/hero_scan.jpg',
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.6),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: AppSpace.xl,
            child: Center(
              child: GestureDetector(
                onTap: onStartScan,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.xxl,
                    vertical: AppSpace.lg,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.ink,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: AppShadows.card,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.face_retouching_natural,
                          color: AppColors.cream, size: 20),
                      const SizedBox(width: AppSpace.sm),
                      Text(
                        'Starta ansiktsscan',
                        style:
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: AppColors.cream,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.step,
    required this.title,
    required this.body,
  });

  final String step;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.blush,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              step,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(width: AppSpace.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpace.xs),
              Text(body, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
