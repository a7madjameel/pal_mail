import 'package:flutter/cupertino.dart';

class Provider extends ChangeNotifier {
  dynamic data;
  dynamic getData() => data;
  void setData(dynamic value) {
    data = value;
    notifyListeners();
  }
}
