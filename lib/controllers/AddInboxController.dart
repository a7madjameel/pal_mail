import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/controllers/CreateSenderController.dart';
import 'package:pal_mail/models/ActivityModel.dart';
import 'package:pal_mail/models/Categories.dart';
import 'package:pal_mail/models/user_data.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';

import '../models/tags.dart';

class AddInboxController {
  Future<bool> addInboxToApi({
    Sender? senderUser,
    String? senderName,
    required int catID,
    required int statusID,
    required String title,
    String? description,
    required String archiveNum,
    required String archiveDate,
    String? decision,
    List<Tag>? tags,
    List<ActivityModel>? activities,
  }) async {
    UserData admin = userFromJson(
        await SharedPrefController().getValueFor(key: PrefKeys.user.name));
    Sender sender;
    sender = senderUser ??
        await CreateSenderController().createSender(senderName!, catID);
    List<int> tagID = [];
    if (tags != null && tags.isNotEmpty) {
      tagID = tags.map((e) => e.id!).toList();
    }
    Map<String, dynamic> activity = {};
    if (activities != null && activities.isNotEmpty) {
      for (int i = 0; i < activities.length; i++) {
        activity.addAll(
            {'body': activities[i].activityContent, 'user_id': admin.user!.id});
      }
    }
    var res = await http.post(
      Uri.parse(ApiController.mails),
      headers: {'Authorization': 'Bearer ${admin.token}'},
      body: {
        'subject': title,
        'description': description,
        'sender_id': sender.id,
        'archive_number': archiveNum,
        'archive_date': archiveDate,
        'decision': decision,
        'status_id': statusID,
        'tags': tagID,
        'activities': activity,
      },
    );
    return res.statusCode == 200 || res.statusCode == 201;
  }
}
