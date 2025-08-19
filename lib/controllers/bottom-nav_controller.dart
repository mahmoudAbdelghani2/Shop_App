import 'package:flutter/material.dart';

class BottomNavController extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setIndex(int newIndex) {
    if (_index == newIndex) return;
    _index = newIndex;
    notifyListeners();
  }
}
