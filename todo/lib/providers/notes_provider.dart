import 'package:flutter/material.dart';
import 'package:todo/models/notes_model.dart';

class NotesProvider with ChangeNotifier {
  List<NotesModel> notes = [];

  void addNote(NotesModel note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote() {}
  void deleteNote() {}
}
