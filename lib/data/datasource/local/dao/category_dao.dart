import 'package:floor/floor.dart';
import 'package:note_application/core/constants/app_constants.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:sqflite/sqflite.dart';

@dao
abstract class CategoryDao {
  @insert
  Future<void> insertCategory(Category category);

  @update
  Future<void> updateCategory(Category category);

  @delete
  Future<void> deleteCategory(Category category);

  @Query(AppConstants.getAllCategoriesQuery)
  Future<List<Category>> getAllCategory();

  static Future<void> insertDefaultData(
    DatabaseExecutor db,
  ) async {
    await db.insert('category', {
      'id': AppConstants.defaultCategoryId,
      'name': AppConstants.defaultCategoryName,
      'color': AppConstants.defaultCategoryColor,
    });
  }
}
