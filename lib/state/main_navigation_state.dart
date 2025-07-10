import 'package:flutter/material.dart';

class MainNavigationState extends ChangeNotifier {
  // ignore: prefer_final_fields
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }
}
