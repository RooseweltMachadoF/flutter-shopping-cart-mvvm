import 'package:flutter/material.dart';

class NavViewModel extends ChangeNotifier {
  int _navIndex = 0;
  int get navIndex => _navIndex;

  void selectNavIndex(int index) {
    _navIndex = index;
    notifyListeners();
  }
}