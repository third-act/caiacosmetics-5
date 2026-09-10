import 'package:flutter/material.dart';

import 'ui/common/app_theme.dart';
import 'ui/views/app_shell.dart';
import 'ui/views/splash_view.dart';

void main() {
  runApp(const CaiaApp());
}

class CaiaApp extends StatefulWidget {
  const CaiaApp({super.key});

  @override
  State<CaiaApp> createState() => _CaiaAppState();
}

class _CaiaAppState extends State<CaiaApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAIA Cosmetics',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: _showSplash
          ? SplashView(
              onComplete: () => setState(() => _showSplash = false),
            )
          : const AppShell(),
    );
  }
}
