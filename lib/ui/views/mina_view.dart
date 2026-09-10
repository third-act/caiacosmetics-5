import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_space.dart';
import '../common/app_theme.dart';
import '../shared_widgets/brand_field.dart';
import '../shared_widgets/pressable_card.dart';

class MinaView extends StatelessWidget {
  const MinaView({super.key});

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
                Text('Mina', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: AppSpace.sm),
                Text(
                  'Profil och favoriter',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpace.section),
                _ProfileHeader(),
                const SizedBox(height: AppSpace.xxxl + AppSpace.lg),
                Text(
                  'Favoriter',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.lg),
                PressableCard(
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border,
                          color: AppColors.hover, size: 22),
                      const SizedBox(width: AppSpace.lg),
                      Expanded(
                        child: Text(
                          'Inga favoriter ännu — spara produkter från rekommendationer',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpace.section),
                Text(
                  'Inställningar',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpace.lg),
                const BrandField(
                  hint: 'Sök i appen',
                  prefixIcon: Icon(Icons.search, color: AppColors.hover),
                ),
                const SizedBox(height: AppSpace.lg),
                _SettingsRow(
                  icon: Icons.notifications_outlined,
                  label: 'Notiser',
                ),
                const SizedBox(height: AppSpace.md),
                _SettingsRow(
                  icon: Icons.privacy_tip_outlined,
                  label: 'Integritet',
                ),
                const SizedBox(height: AppSpace.md),
                _SettingsRow(
                  icon: Icons.help_outline,
                  label: 'Hjälp',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PressableCard(
      backgroundColor: AppColors.softPink,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.blush,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person_outline, color: AppColors.ink),
          ),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CAIA-kund',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Inloggad · Mock-profil',
                  style: Theme.of(context).textTheme.bodyMedium,
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

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.lg,
        vertical: AppSpace.lg,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.ink, size: 22),
          const SizedBox(width: AppSpace.lg),
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.titleMedium),
          ),
          const Icon(Icons.chevron_right, color: AppColors.hover, size: 20),
        ],
      ),
    );
  }
}
