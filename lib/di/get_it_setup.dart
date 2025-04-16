import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:note_application/data/datasource/local/dao/category_dao.dart';
import 'package:note_application/data/datasource/local/note_database.dart';
import 'package:note_application/data/repository/category_repository.dart';
import 'package:note_application/data/repository/note_repository.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';

abstract class GetItSetup {
  static void setupDependencies() {
    final getIt = GetIt.instance;
    getIt.registerSingletonAsync<NoteDatabase>(
      $FloorNoteDatabase
          .databaseBuilder('database.db')
          .addCallback(
            Callback(
              onCreate:
                  (database, version) =>
                      CategoryDao.insertDefaultData(
                        database,
                      ),
            ),
          )
          .build,
    );
    getIt.registerFactory<NoteRepository>(
      () => NoteRepository(getIt<NoteDatabase>().noteDao),
    );
    getIt.registerFactory<CategoryRepository>(
      () => CategoryRepository(
        getIt<NoteDatabase>().categoryDao,
      ),
    );
    getIt.registerFactory<NoteViewModel>(
      () => NoteViewModel(getIt<NoteRepository>()),
    );
    getIt.registerFactory<CategoryViewModel>(
      () => CategoryViewModel(getIt<CategoryRepository>()),
    );
  }
}
