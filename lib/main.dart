import 'package:flutter/material.dart';

import 'ui/common/app_theme.dart';
import 'ui/views/app_shell.dart';
import 'ui/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CaiaApp());
}

class CaiaApp extends StatefulWidget {
  const CaiaApp({super.key});

  @override
  State<CaiaApp> createState() => _CaiaAppState();
}

class _CaiaAppState extends State<CaiaApp> {
  bool _showSplash = true;
  bool _precached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) return;
    _precached = true;
    for (final path in const [
      'assets/images/hero_hem.jpg',
      'assets/images/caia_logo.png',
      'assets/images/product_dewy_drops.jpg',
      'assets/images/product_wake_me_up.jpg',
      'assets/images/product_glow_blush.jpg',
      'assets/images/product_lip_balm.jpg',
      'assets/images/portrait_scan.jpg',
    ]) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAIA Cosmetics',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: Stack(
        fit: StackFit.expand,
        children: [
          const AppShell(),
          if (_showSplash)
            SplashView(
              onComplete: () => setState(() => _showSplash = false),
            ),
        ],
      ),
    );
  }
}
