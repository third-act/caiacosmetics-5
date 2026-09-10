import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_shadows.dart';
import '../common/app_space.dart';

class TabPillItem {
  const TabPillItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

/// Floating bottom tab pill — vertical icon-over-label for ≥4 tabs.
class TabPill extends StatelessWidget {
  const TabPill({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<TabPillItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpace.screen,
        vertical: AppSpace.lg,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.sm,
        vertical: AppSpace.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.cream.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(28),
        boxShadow: AppShadows.pill,
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpace.sm,
                  horizontal: AppSpace.xs,
                ),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.blush : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 22,
                      color: AppColors.ink,
                    ),
                    const SizedBox(height: AppSpace.xs),
                    Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w500,
                        color: AppColors.ink,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
