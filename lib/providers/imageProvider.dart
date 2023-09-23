import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImagesProvider extends ChangeNotifier {
  List<File> images = [];
  void addImages(List<File> listOfImages) {
    images.addAll(listOfImages);
    notifyListeners();
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  void clearData() {
    images.clear();
    notifyListeners();
  }
}
