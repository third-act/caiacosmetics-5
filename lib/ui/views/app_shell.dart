import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../common/app_colors.dart';
import '../common/app_space.dart';
import '../common/app_theme.dart';
import '../shared_widgets/tab_pill.dart';
import 'app_shell_viewmodel.dart';
import 'for_dig_view.dart';
import 'hem_view.dart';
import 'hudscan_view.dart';
import 'mina_view.dart';
import 'produkt_detail_view.dart';
import 'resultat_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final _vm = AppShellViewModel();

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  void _pushResultat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResultatView(
          onBack: () => Navigator.of(context).pop(),
          onProductTap: _pushProduct,
          onViewRecommendations: () {
            Navigator.of(context).pop();
            _vm.selectTab(2);
          },
        ),
      ),
    );
  }

  void _pushProduct(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProduktDetailView(
          product: product,
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _vm,
      builder: (context, _) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.cream,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              decoration: AppTheme.frostedHeader(),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.screen,
                    vertical: AppSpace.sm,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/caia_logo.png',
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined,
                            color: AppColors.ink, size: 22),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              final mq = MediaQuery.of(context);
              final clearance = AppSpace.tabClearance;
              return MediaQuery(
                data: mq.copyWith(
                  padding: mq.padding.copyWith(
                    bottom: mq.padding.bottom + clearance,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: clearance),
                  child: IndexedStack(
                    index: _vm.tabIndex,
                    children: [
                      HemView(
                        onStartScan: _pushResultat,
                        onProductTap: _pushProduct,
                        onGoToHudscan: () => _vm.selectTab(1),
                      ),
                      HudscanView(
                        onStartScan: _pushResultat,
                        onViewResult: _pushResultat,
                      ),
                      ForDigView(onProductTap: _pushProduct),
                      const MinaView(),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: TabPill(
            currentIndex: _vm.tabIndex,
            onTap: _vm.selectTab,
            items: const [
              TabPillItem(icon: Icons.home_outlined, label: 'Hem'),
              TabPillItem(
                  icon: Icons.face_retouching_natural_outlined,
                  label: 'Hudscan'),
              TabPillItem(icon: Icons.auto_awesome_outlined, label: 'För dig'),
              TabPillItem(icon: Icons.person_outline, label: 'Mina'),
            ],
          ),
        );
      },
    );
  }
}
