import 'package:flutter/cupertino.dart';
import 'package:pal_mail/controllers/tags_controller.dart';
import 'package:pal_mail/models/tags.dart';

class TagsProvider extends ChangeNotifier {
  List<Tag> selectedTags = [];
  List<Tag> allTags = [];
  void addToTags(Tag tag) {
    allTags.add(tag);
    selectedTags.add(tag);
    TagsController()
        .createTag(tag.name!)
        .then((value) => value ? notifyListeners() : null);
  }

  Future<void> initList() async {
    allTags = await TagsController().getAllTags();
  }

  void deSelectTag(int id) {
    selectedTags.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void selectTag(int id) {
    selectedTags.add(allTags.where((element) => element.id == id).first);
    notifyListeners();
  }

  void clearSelectedTags() {
    selectedTags.clear();
    notifyListeners();
  }
}
