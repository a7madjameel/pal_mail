import 'package:flutter/material.dart';

class TitleAndDescriptionProvider extends ChangeNotifier {
  String? title;
  String? description;
  void setTitle(String? inboxTitle) {
    title = inboxTitle;
    notifyListeners();
  }

  void setDescription(String? inboxDescription) {
    description = inboxDescription;
    notifyListeners();
  }
}
