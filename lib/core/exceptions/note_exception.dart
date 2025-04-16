class NoteException implements Exception {
  final String message;

  NoteException(this.message);

  @override
  String toString() {
    return message;
  }
}
