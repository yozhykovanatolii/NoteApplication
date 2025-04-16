import 'package:note_application/data/datasource/local/dao/category_dao.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';

class CategoryRepository {
  final CategoryDao _categoryDao;

  CategoryRepository(this._categoryDao);

  Future<void> insertCategory(Category category) async {
    await _categoryDao.insertCategory(category);
  }

  Future<void> updateCategory(Category category) async {
    await _categoryDao.updateCategory(category);
  }

  Future<void> deleteCategory(Category category) async {
    final categories = await getCategories();
    if (categories.length <= 1) return;
    await _categoryDao.deleteCategory(category);
  }

  Future<List<Category>> getCategories() async {
    return _categoryDao.getAllCategory();
  }
}
