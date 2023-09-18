import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';

import '../models/ActivityModel.dart';

class ActivityProvider extends ChangeNotifier {
  List<ActivityModel> activities = [];
  void addActivity(String content) async {
    DateTime date = DateTime.now();
    String displayDate = DateFormat('d MMM yyyy').format(date).toString();
    activities = activities.reversed.toList();
    var senderName =
        await SharedPrefController().getValueFor(key: PrefKeys.user.name);
    activities.add(ActivityModel(
        formattedTimeOfActivity: displayDate,
        senderName: senderName,
        activityContent: content));
    activities = activities.reversed.toList();
    notifyListeners();
  }

  void resetActivity() {
    activities.clear();
    notifyListeners();
  }
}
