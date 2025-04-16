import 'package:note_application/data/datasource/local/entity/note.dart';

class NoteViewState {
  final String errorMessage;
  final List<Note> notes;
  final bool isLoading;

  NoteViewState({
    required this.errorMessage,
    required this.notes,
    required this.isLoading,
  });

  factory NoteViewState.initial() {
    return NoteViewState(
      errorMessage: '',
      notes: [],
      isLoading: false,
    );
  }

  NoteViewState copyWith({
    String? errorMessage,
    List<Note>? notes,
    bool? isLoading,
  }) {
    return NoteViewState(
      errorMessage: errorMessage ?? this.errorMessage,
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
