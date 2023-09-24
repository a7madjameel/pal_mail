import 'package:pal_mail/controllers/CreateSenderController.dart';
import 'package:pal_mail/models/ActivityModel.dart';
import 'package:pal_mail/models/Categories.dart';

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
    Sender sender;
    sender = senderUser ??
        await CreateSenderController().createSender(senderName!, catID);
    return true;
  }
}
