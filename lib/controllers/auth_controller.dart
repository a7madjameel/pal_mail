import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../api/api_controller.dart';
import '../core/helper/api_helper.dart';
import '../core/helper/helper.dart';
import '../models/user_data.dart';
import '../pref/shared_pref_controller.dart';

class AuthController with Helper {
  Future<ApiHelper> login(String email, String password) async {
    Uri uri = Uri.parse(ApiController.login);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });
    //To check the operation in console we used print statement
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 403) {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        UserData user = UserData.fromJson(json);
        //Save userData in sharedPref
        SharedPrefController().save(user);
        return ApiHelper(message: 'Operation Successfully', success: true);
      }
      return ApiHelper(message: 'Operation failed', success: false);
    }
    return errorResponse;
  }

  Future<ApiHelper> register({required Map<String, dynamic> body}) async {
    Uri uri = Uri.parse(ApiController.register);
    var response = await http.post(uri, body: body);
    //To check the operation in console we used print statement
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        UserData user = UserData.fromJson(jsonResponse['user']);
        SharedPrefController().save(user);
        return ApiHelper(message: jsonResponse['message'], success: true);
      }
      return ApiHelper(message: jsonResponse['message'], success: false);
    }
    return errorResponse;
  }

  Future<ApiHelper> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiController.logout);
    var response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    //To check the operation in console we used print statement
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      SharedPrefController().clear();
      return ApiHelper(message: jsonResponse['message'], success: true);
    }
    return errorResponse;
  }

  Future<ApiHelper> currentUser() async {
    String token =
        SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiController.user);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    //To check the operation in console we used print statement
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ApiHelper(message: 'Operation Successfully', success: true);
    }
    return errorResponse;
  }
}
