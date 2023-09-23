import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';

import '../models/Categories.dart';

class CategoryController {
  Future<Categories> getAllCategories() async {
    Uri uri = Uri.parse(ApiController.categories);
    var t = await SharedPrefController().getValueFor(key: PrefKeys.token.name);
    var response = await http.get(uri, headers: {
      'Authorization': 'Bearer $t',
    });
    if (response.statusCode == 200) {
      var cat = categoriesFromJson(response.body);
      print(cat);
      return cat;
    }
    return Categories();
  }
}
