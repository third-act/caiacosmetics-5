import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_shadows.dart';
import '../common/app_space.dart';

class PressableCard extends StatelessWidget {
  const PressableCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.borderRadius = 16,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppColors.cream,
      elevation: 0,
      shadowColor: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.cream,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: AppShadows.card,
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppSpace.card),
            child: child,
          ),
        ),
      ),
    );
  }
}
