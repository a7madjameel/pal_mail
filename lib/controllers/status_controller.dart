import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';

import '../models/Status.dart';
import '../pref/shared_pref_controller.dart';

class StatusController {
  Future<List<Status>> getAllStatues() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiController.statuses);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['statuses'] as List<dynamic>;
      return jsonArray.map((e) => Status.fromJson(e)).toList();
    }
    return [];
  }
}
