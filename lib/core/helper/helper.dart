import 'package:pal_mail/core/helper/api_helper.dart';
import 'package:flutter/material.dart';

mixin Helper {
  void showSnackBar(BuildContext context,
      {required String message, bool success = true}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: success ? Colors.green.shade500 : Colors.red.shade500,
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  ApiHelper get errorResponse =>
      ApiHelper(message: 'Something went wrong', success: false);
}
