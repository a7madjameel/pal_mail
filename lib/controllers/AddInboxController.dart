import 'package:pal_mail/controllers/CreateSenderController.dart';
import 'package:pal_mail/models/Categories.dart';

class AddInboxController {
  Future<void> addInboxToApi(
      {Sender? senderUser, String? senderName, required int catID}) async {
    Sender sender;
    sender = senderUser ??
        await CreateSenderController().createSender(senderName!, catID);
  }
}
