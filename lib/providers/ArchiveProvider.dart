import 'package:flutter/material.dart';

class ArchiveProvider extends ChangeNotifier {
  late String date;
  String? archiveNum;
  void setDate(String dateOfArchive) {
    date = dateOfArchive;
    notifyListeners();
  }

  void setArchiveNum(String? archiveNumber) {
    archiveNum = archiveNumber;
    notifyListeners();
  }
}
