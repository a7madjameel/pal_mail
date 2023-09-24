import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/mail.dart';
import '../pref/shared_pref_controller.dart';

class SearchControllerA {
  Future<List<Mail>> getSearchResult(String text ) async {
    String token =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    Uri uri = Uri.parse("https://palmail.gsgtt.tech/api/search?text=$text&end&status_id");
    //print(token);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

      var jsonArray = jsonResponse['mails'] as List;
    print(jsonArray);
    // some Edits (like original method) ..
      return jsonArray.map((jsonObject) => Mail.fromJson(jsonObject)).toList();
    }

    return [];
  }
}
