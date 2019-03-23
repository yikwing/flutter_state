import 'package:flutter/material.dart';

class SwitchChange extends ChangeNotifier {
  bool isSwitch = false;

  changeSwitch(bool type) {
    isSwitch = type;
    notifyListeners();
  }
}
