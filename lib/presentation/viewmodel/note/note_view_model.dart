import 'package:flutter/foundation.dart';
import 'package:note_application/core/constants/app_constants.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';
import 'package:note_application/data/repository/note_repository.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_state.dart';

class NoteViewModel extends ChangeNotifier {
  final NoteRepository _noteRepository;
  NoteViewState _noteViewState = NoteViewState.initial();
  int? _selectedCategoryId = 1;
  String _titleNote = '';
  String _bodyNote = '';
  String? _errorNoteTitle;

  int? get selectedCategoryId => _selectedCategoryId;
  String? get errorNoteTitle => _errorNoteTitle;
  NoteViewState get noteViewState => _noteViewState;

  NoteViewModel(this._noteRepository) {
    getNotesByCategoryId();
  }

  Future<void> onSelectedCategoryChip(
    int? categoryId, {
    bool shouldUpdateNotes = true,
  }) async {
    if (_selectedCategoryId != categoryId) {
      _selectedCategoryId = categoryId;
      if (shouldUpdateNotes) {
        await getNotesByCategoryId();
      } else {
        notifyListeners();
      }
    }
  }

  void setNoteTitle(String title) {
    _titleNote = title;
    _errorNoteTitle =
        title.isEmpty
            ? AppConstants.defaultErrorTitleNoteMessage
            : null;
    notifyListeners();
  }

  void setNoteBody(String body) {
    _bodyNote = body;
    notifyListeners();
  }

  Future<void> getNotesByCategoryId() async {
    _updateNoteViewState(isLoading: true, errorMessage: '');
    notifyListeners();
    try {
      final notes = await _noteRepository
          .getNotesByCategoryId(_selectedCategoryId!);
      _updateNoteViewState(notes: notes);
    } catch (exception) {
      _updateNoteViewState(
        errorMessage: exception.toString(),
      );
    } finally {
      _updateNoteViewState(isLoading: false);
    }
    notifyListeners();
  }

  void searchNotes(String text) async {
    _updateNoteViewState(isLoading: true, errorMessage: '');
    notifyListeners();
    try {
      final notes = await _noteRepository.searchNotes(
        text,
        _selectedCategoryId!,
      );
      _updateNoteViewState(notes: notes);
    } catch (exception) {
      _updateNoteViewState(
        errorMessage: exception.toString(),
      );
    } finally {
      _updateNoteViewState(isLoading: false);
    }
    notifyListeners();
  }

  void _updateNoteViewState({
    bool? isLoading,
    String? errorMessage,
    List<Note>? notes,
  }) {
    _noteViewState = _noteViewState.copyWith(
      isLoading: isLoading,
      errorMessage: errorMessage,
      notes: notes,
    );
  }

  Future<void> insertNote(Note note) async {
    await _noteRepository.insertNote(note);
    await getNotesByCategoryId();
  }

  Future<void> updateNote(Note note) async {
    await _noteRepository.updateNote(note);
    await getNotesByCategoryId();
  }

  Future<void> deleteNote(Note note) async {
    await _noteRepository.deleteNote(note);
    await getNotesByCategoryId();
  }

  void setEditingNote(Note? note) {
    if (note != null) {
      _titleNote = note.title;
      _bodyNote = note.body;
      _selectedCategoryId = note.categoryId;
    }
  }

  void saveNote(Note? note) {
    if (_errorNoteTitle != null) return;
    if (note == null) {
      insertNote(
        Note(
          title: _titleNote,
          body: _bodyNote,
          categoryId: _selectedCategoryId!,
        ),
      );
    } else {
      updateNote(
        note.copyWith(
          title: _titleNote,
          body: _bodyNote,
          categoryId: _selectedCategoryId,
        ),
      );
    }
  }
}
