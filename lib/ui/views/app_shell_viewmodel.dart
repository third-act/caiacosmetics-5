import 'package:flutter/foundation.dart';

class AppShellViewModel extends ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void selectTab(int index) {
    if (_tabIndex == index) return;
    _tabIndex = index;
    notifyListeners();
  }
}
