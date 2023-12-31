import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/core/helper/api_helper.dart';

import '../core/utils/constants.dart';
import '../models/Status.dart';
import '../pref/shared_pref_controller.dart';

class StatusController {
  Future<ApiHelper> getAllStatues() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiController.statuses);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptCharsetHeader: 'application/json'
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var getStatus = Status.fromJson(jsonResponse);

      return ApiHelper(
          data: getStatus, success: true, message: 'Operation success');
    }
    return ApiHelper(message: 'Operation failed', success: false);
  }
}
