import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';

import '../models/Categories.dart';

class CreateSenderController {
  Future<Sender> createSender(String userName, int catID) async {
    Sender sender;
    var token =
        await SharedPrefController().getValueFor(key: PrefKeys.token.name);
    var res = await http.post(
      Uri.parse(ApiController.senders),
      body: {
        'name': userName,
        'mobile':
            '${DateTime.now().hour}${DateTime.now().second}${DateTime.now().microsecond}${DateTime.now().day}${DateTime.now().year}',
        'address': '',
        'category_id': catID,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    sender = Sender.fromJson(jsonDecode(res.body)['sender']);
    return sender;
  }
}
