import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';

import '../core/utils/constants.dart';
import '../models/Status.dart';

class StatusController {
  Future<List<Status>> getAllStatues() async {
    Uri uri = Uri.parse(ApiController.statuses);
    var response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['statuses'] as List<dynamic>;
      return jsonArray.map((e) => Status.fromJson(e)).toList();
    }
    return [Status()];
  }
}
