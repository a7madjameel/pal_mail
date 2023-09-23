import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';

import '../models/tags.dart';
import '../pref/shared_pref_controller.dart';

class TagsController {
  Future<List<Tag>> getAllTags() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiController.tags);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['tags'] as List;
      return jsonArray.map((jsonObject) => Tag.fromJson(jsonObject)).toList();
    }
    return [];
  }
}
