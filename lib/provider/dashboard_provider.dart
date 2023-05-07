import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  int iMenu = 1;

  void onklik(int index) {
    iMenu = index;
    notifyListeners();
  }
}
