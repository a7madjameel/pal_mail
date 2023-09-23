import 'package:flutter/cupertino.dart';
import 'package:pal_mail/models/Categories.dart';

class SenderProvider extends ChangeNotifier {
  String? sender;
  Sender? senderFromAPI;
  void setData({String? senderName, Sender? senderUser}) {
    sender = senderName;
    senderFromAPI = senderUser;
    notifyListeners();
  }
}
