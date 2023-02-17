import 'package:flutter/material.dart';
import 'package:todo/models/notes_model.dart';

class NotesProvider with ChangeNotifier {
  List<NotesModel> notes = [];

  void addNote(NotesModel note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote(NotesModel note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    notifyListeners();
  }

  void deleteNote(NotesModel note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    notifyListeners();
  }
}
