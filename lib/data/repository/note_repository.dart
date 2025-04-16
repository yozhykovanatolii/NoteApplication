import 'package:note_application/core/constants/app_constants.dart';
import 'package:note_application/core/exceptions/note_exception.dart';
import 'package:note_application/data/datasource/local/dao/note_dao.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';

class NoteRepository {
  final NoteDao _noteDao;

  NoteRepository(this._noteDao);

  Future<void> insertNote(Note note) async {
    await _noteDao.insertNote(note);
  }

  Future<void> updateNote(Note note) async {
    await _noteDao.updateNote(note);
  }

  Future<void> deleteNote(Note note) async {
    await _noteDao.deleteNote(note);
  }

  Future<List<Note>> searchNotes(
    String text,
    int categoryId,
  ) async {
    final notes = await _noteDao.searchNotesByCategory(
      categoryId,
      text,
    );
    if (notes.isNotEmpty) {
      return notes;
    }
    throw NoteException(
      AppConstants.defaultErrorSearchNotesMessage,
    );
  }

  Future<List<Note>> getNotesByCategoryId(
    int categoryId,
  ) async {
    final notes = await _noteDao.getNotesByCategoryId(
      categoryId,
    );
    if (notes.isNotEmpty) {
      return notes;
    }
    throw NoteException(
      AppConstants.defaultErrorGetNotesByCategoryIdMessage,
    );
  }
}
