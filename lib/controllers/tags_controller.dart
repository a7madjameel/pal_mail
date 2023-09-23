import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/core/helper/api_helper.dart';

import '../models/tags.dart';
import '../pref/shared_pref_controller.dart';

class TagsController {
  Future<ApiHelper> getAllTags() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiController.tags);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = Tag.fromJson(jsonResponse);
      return ApiHelper(
          data: jsonArray, message: 'Operation success', success: true);
    }
    return ApiHelper(message: 'Operation failed', success: false);
  }

  Future<ApiHelper> createTags({required String name}) async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiController.tags);
    var response = await http.post(uri, body: {
      'name': name,
    }, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiHelper(message: jsonResponse['message'], success: true);
    }
    return ApiHelper(message: 'Something error ,try again', success: false);
  }
}
