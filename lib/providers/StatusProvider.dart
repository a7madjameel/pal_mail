import 'package:flutter/material.dart';

import '../models/Status.dart';

class StatusProvider extends ChangeNotifier {
  List<Status> statusList = List.generate(
      4,
      (index) => Status(
          color: '0xffFA3A5$index'.replaceAll('0xff', ''),
          name: 'Inbox $index'));
  int? selectedStatus;
  void setSelectedStatus(int? index) {
    selectedStatus = index;
    notifyListeners();
  }

  void editStatus(String? statusName, int statusIndex) {
    if (statusName != null && statusName.isNotEmpty) {
      statusList[statusIndex].name = statusName;
    }
    notifyListeners();
  }
}
