import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/core/helper/api_helper.dart';

import '../models/categories.dart';
import '../pref/shared_pref_controller.dart';

class CategoryController {
  Future<ApiHelper> getAllCategories() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiController.categories);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = CategoryModel.fromJson(jsonResponse);
      return ApiHelper(
          data: jsonObject, message: 'Operation success', success: true);
    }
    return ApiHelper(message: 'Operation failed', success: false);
  }
}
