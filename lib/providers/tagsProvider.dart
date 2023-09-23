import 'package:flutter/cupertino.dart';

import '../controllers/tags_controller.dart';
import '../models/mail.dart';

enum TagStatues { initial, loading, complete, error }

class TagsProvider extends ChangeNotifier {
  TagStatues _statues = TagStatues.initial;

  TagsProvider() {
    getAllTags();
  }

  TagStatues get statues => _statues;
  List<Tags>? _tag;

  List<Tags>? get tag => _tag;
  final TagsController _apiController = TagsController();

  Future<void> getAllTags() async {
    _statues = TagStatues.loading;
    notifyListeners();

    try {
      final res = await _apiController.getAllTags();
      _tag = res.data.tags;
      _statues = TagStatues.complete;
      notifyListeners();
    } catch (e) {
      _statues = TagStatues.error;
      notifyListeners();
    }
  }
}
