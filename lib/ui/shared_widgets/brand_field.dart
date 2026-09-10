import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_space.dart';

/// CAIA text field — no OutlineInputBorder, no floating labels.
class BrandField extends StatelessWidget {
  const BrandField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.obscureText = false,
  });

  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.lg),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
        ),
      ),
    );
  }
}
