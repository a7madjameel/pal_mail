import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  List items = [
    'Official organization',
    'NGOs',
    'UnBorder',
    'Others',
  ];
  int? data;
  String getData() {
    if (data == null) {
      return items[items.length - 1];
    }
    return items[data!];
  }

  setData(int index) {
    data = index;
    notifyListeners();
  }

  getIndex() {
    if (data == null) {
      return items.length - 1;
    }
    return data;
  }
}
