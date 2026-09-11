import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_space.dart';

abstract final class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.cream,
      canvasColor: AppColors.cream,
      colorScheme: ColorScheme.light(
        surface: AppColors.cream,
        primary: AppColors.blush,
        onPrimary: AppColors.ink,
        onSurface: AppColors.ink,
        secondary: AppColors.softPink,
      ),
      fontFamily: 'Artico',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        foregroundColor: AppColors.ink,
        titleTextStyle: TextStyle(
          fontFamily: 'Artico',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          letterSpacing: 0.2,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          height: 1.25,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.ink,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.ink,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.hover,
          height: 1.45,
        ),
        labelLarge: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          letterSpacing: 0.4,
        ),
      ),
      dividerColor: AppColors.blush.withValues(alpha: 0.5),
      splashColor: AppColors.blush.withValues(alpha: 0.2),
      highlightColor: AppColors.blush.withValues(alpha: 0.1),
    );
  }

  static BoxDecoration frostedHeader() => BoxDecoration(
        color: AppColors.cream.withValues(alpha: 0.82),
        border: Border(
          bottom: BorderSide(
            color: AppColors.blush.withValues(alpha: 0.35),
          ),
        ),
      );

  static EdgeInsets tabContentPadding() => const EdgeInsets.symmetric(
        horizontal: AppSpace.screen,
      );
}
