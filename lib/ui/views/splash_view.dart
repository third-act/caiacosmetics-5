import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_space.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 1800), widget.onComplete);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: FadeTransition(
        opacity: _fade,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/caia_logo.png',
                height: 48,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: AppSpace.section),
              Text(
                'Din hud, dina produkter',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.hover,
                      letterSpacing: 0.3,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
