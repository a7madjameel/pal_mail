import 'package:flutter/cupertino.dart';

import '../controllers/category_controller.dart';
import '../models/categories.dart';

enum CategoryState { initial, loading, complete, error }

class CategoryProvider extends ChangeNotifier {
  CategoryState _state = CategoryState.initial;

  CategoryState get state => _state;
  List<CategoryModel>? _category;

  List<CategoryModel>? get category => _category;
  final CategoryController _categoryController = CategoryController();

  CategoryProvider() {
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    _state = CategoryState.loading;
    notifyListeners();

    try {
      final repo = await _categoryController.getAllCategories();
      _category = repo.data.categories;
      _state = CategoryState.complete;
      notifyListeners();
    } catch (e) {
      _state = CategoryState.error;
      notifyListeners();
    }
  }
}
