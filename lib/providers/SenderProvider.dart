import 'package:flutter/cupertino.dart';

import '../models/user_data.dart';

class SenderProvider extends ChangeNotifier {
  String? sender;
  void setData(String? senderName, {User? senderUser}) {
    sender = senderName;
    notifyListeners();
  }
}
