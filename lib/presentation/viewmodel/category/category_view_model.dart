import 'package:flutter/material.dart';
import 'package:note_application/core/constants/app_constants.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/data/repository/category_repository.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;

  List<Category> _categories = [];
  String _nameCategory = '';
  String? _errorText;
  int _currentCategoryColor =
      AppConstants.defaultCategoryColor;
  int _selectedColorIndex = 0;

  List<Category> get categories => _categories;
  String? get errorText => _errorText;
  int get selectedColorIndex => _selectedColorIndex;

  CategoryViewModel(this._categoryRepository) {
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    _categories = await _categoryRepository.getCategories();
    notifyListeners();
  }

  Future<void> insertCategory(Category category) async {
    await _categoryRepository.insertCategory(category);
    await getAllCategories();
  }

  Future<void> deleteCategory(Category category) async {
    await _categoryRepository.deleteCategory(category);
    await getAllCategories();
  }

  Future<void> updateCategory(Category category) async {
    await _categoryRepository.updateCategory(category);
    await getAllCategories();
  }

  void selectColor(int colorIndex, int color) {
    if (_selectedColorIndex != colorIndex) {
      _selectedColorIndex = colorIndex;
      _currentCategoryColor = color;
    }
    notifyListeners();
  }

  void setCategoryName(String name) {
    _errorText =
        name.isEmpty || name.length > 50
            ? AppConstants.defaultErrorNameCategoryMessage
            : null;
    _nameCategory = name;
    notifyListeners();
  }

  void setEditingCategory(Category? category) {
    if (category != null) {
      _nameCategory = category.name;
      _currentCategoryColor = category.color;
    }
  }

  void setCategory(Category? category) {
    if (_errorText != null) return;
    if (category == null) {
      insertCategory(
        Category(_nameCategory, _currentCategoryColor),
      );
    } else {
      updateCategory(
        category.copyWith(
          name: _nameCategory,
          color: _currentCategoryColor,
        ),
      );
    }
  }
}
