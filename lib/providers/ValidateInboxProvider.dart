import 'package:pal_mail/providers/Provider.dart';
import 'package:pal_mail/providers/SenderProvider.dart';

class ValidateInboxProvider extends Provider {
  @override
  void setData(value) {
    bool validation = true;
    var sender = SenderProvider().getData();
    if (sender.isNull || sender.isEmpty) {
      validation = false;
    }
    super.setData(validation);
  }
}
