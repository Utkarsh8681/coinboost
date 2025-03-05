import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  double _reward = 0.0;

  double get reward => _reward;

  void incrementReward(double amount) {
    _reward += amount;
    notifyListeners();
  }
}
