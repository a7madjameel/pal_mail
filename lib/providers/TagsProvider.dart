import 'package:flutter/cupertino.dart';

class TagsProvider extends ChangeNotifier {
  List selectedTags = [];
  List allTags = [];
  void addToTags(String tag) {
    allTags.add(tag);
    selectedTags.add(tag);
    notifyListeners();
  }

  void deSelectTag(int index) {
    selectedTags.removeAt(index);
    notifyListeners();
  }

  void selectTag(int index) {
    selectedTags.add(allTags[index]);
    notifyListeners();
  }

  void clearSelectedTags() {
    selectedTags.clear();
    notifyListeners();
  }
}
