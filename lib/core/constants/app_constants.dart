abstract class AppConstants {
  static const String databaseName = 'database.db';
  static const int databaseVersion = 1;
  static const int defaultCategoryId = 1;
  static const int defaultCategoryColor = 0xFFF44336;
  static const String defaultCategoryName = 'Job';
  static const String getAllCategoriesQuery =
      'SELECT * FROM category';
  static const String getAllNotesByCategoryIdQuery =
      'SELECT * FROM note WHERE category_id = :categoryId';
  static const String searchNotesByCategoryQuery =
      "SELECT * FROM note WHERE category_id = :categoryId AND (title LIKE '%' || :searchText || '%' OR body LIKE '%' || :searchText || '%')";
  static const String defaultErrorNameCategoryMessage =
      'Category name must not be empty or exceed 50 characters.';
  static const String defaultErrorTitleNoteMessage =
      'Title cannot be empty';
  static const String defaultErrorSearchNotesMessage =
      'No notes were found for this search.';
  static const String
  defaultErrorGetNotesByCategoryIdMessage =
      'There are no tasks in this category.';
}
