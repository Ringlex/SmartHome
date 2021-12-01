import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int actualTab = 0;

  Future<void> setIndexTab(int index) async { 
    actualTab = index;
    print('actual TAB $actualTab');
    //notifyListeners();
  }
}