import 'package:flutter/material.dart';
import 'package:pal_mail/controllers/status_controller.dart';

import '../models/Status.dart';

class StatusProvider extends ChangeNotifier {
  late List<Status> statusList = [Status(color: '', name: 'inbox')];
  StatusProvider() {
    initList();
  }
  Future<void> initList() async {
    statusList = await StatusController().getAllStatues();
  }

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
