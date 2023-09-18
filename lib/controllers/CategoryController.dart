import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';

import '../core/utils/constants.dart';
import '../models/Categories.dart';

class CategoryController {
  Future<List<Categories>?> getAllCategories() async {
    Uri uri = Uri.parse(ApiController.categories);
    var response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['categories'] as List<dynamic>;
      List<Categories> res =
          jsonArray.map((e) => Categories.fromJson(e)).toList();

      return res;
    }
    return [];
  }
}
