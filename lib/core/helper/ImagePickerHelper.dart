import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pal_mail/providers/imageProvider.dart';
import 'package:provider/provider.dart';

mixin ImagePickerHelper {
  Future<void> getMultiImage(context) async {
    var images = await ImagePicker().pickMultiImage();
    var newImage = images.map((e) => File(e.path)).toList();
    Provider.of<ImagesProvider>(context, listen: false).addImages(newImage);
  }
}
