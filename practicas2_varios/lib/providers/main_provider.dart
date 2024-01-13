import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex(int index) {
    if(index == selectedIndex)  return;

    selectedIndex = index;
    notifyListeners();
  }
}