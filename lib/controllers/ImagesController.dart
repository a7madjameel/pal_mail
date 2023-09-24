import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pal_mail/api/api_controller.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';

class ImagesController {
  Future<int> uploadImage(File file, mailId) async {
    String token =
        await SharedPrefController().getValueFor(key: PrefKeys.token.name);
    var request =
        http.MultipartRequest("POST", Uri.parse(ApiController.attachments));
    var pic = await http.MultipartFile.fromPath('image', file.path);
    request.fields['mail_id'] = mailId.toString();
    request.fields['title'] = 'image_${DateTime.now()}';
    request.files.add(pic);
    request.headers.addAll(
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return response.statusCode;
  }
}
