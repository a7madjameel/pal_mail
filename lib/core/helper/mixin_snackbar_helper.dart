import 'package:pal_mail/core/helper/api_helper.dart';
import 'package:flutter/material.dart';

mixin SnackBarHelper {
  void showSnackBar(BuildContext context,
      {required String message, bool error = true}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: error ? Colors.red.shade500 : Colors.green.shade500,
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  ApiHelper get errorResponse =>
      ApiHelper(message: 'Something went wrong', success: false);
}
