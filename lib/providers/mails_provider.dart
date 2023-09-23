import 'package:flutter/cupertino.dart';

import '../controllers/mail_controller.dart';
import '../models/mail.dart';

enum MailsState { initial, loading, complete, error }

class MailProvider extends ChangeNotifier {
  MailsState _state = MailsState.initial;

  MailsState get state => _state;

  List<Mails>? _mails;

  List<Mails>? get allMails => _mails;
  final MailController _mailApiController = MailController();

  MailProvider() {
    getAllMails();
  }

  Future<void> getAllMails() async {
    _state = MailsState.loading;
    notifyListeners();

    try {
      final repo = await _mailApiController.getAllMails();
      _mails = repo.data.mails;
      _state = MailsState.complete;
      notifyListeners();
    } catch (e) {
      _state = MailsState.error;
      notifyListeners();
    }
  }
}
