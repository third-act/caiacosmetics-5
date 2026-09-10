import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Soft depth shadows for cards and floating chrome.
abstract final class AppShadows {
  static List<BoxShadow> card = [
    BoxShadow(
      color: AppColors.ink.withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: AppColors.ink.withValues(alpha: 0.03),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> pill = [
    BoxShadow(
      color: AppColors.ink.withValues(alpha: 0.08),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> glow = [
    BoxShadow(
      color: AppColors.blush.withValues(alpha: 0.45),
      blurRadius: 40,
      spreadRadius: 4,
      offset: const Offset(0, 12),
    ),
  ];
}
