import 'package:floor/floor.dart';
import 'package:note_application/core/constants/app_constants.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';

@dao
abstract class NoteDao {
  @insert
  Future<void> insertNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @Query(AppConstants.getAllNotesByCategoryIdQuery)
  Future<List<Note>> getNotesByCategoryId(int categoryId);

  @Query(AppConstants.searchNotesByCategoryQuery)
  Future<List<Note>> searchNotesByCategory(
    int categoryId,
    String searchText,
  );
}
