import 'package:flutter/material.dart';

class DecisionProvider extends ChangeNotifier {
  String? decision;
  void setDecision(String? decisionText) {
    decision = decisionText;
    notifyListeners();
  }
}
