import 'package:flutter/material.dart';
import 'package:todo/models/notes_model.dart';
import 'package:todo/services/api_services.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    fetchNote();
  }
  bool isLoading = true;
  List<NotesModel> notes = [];

  void sortNode() {
    notes.sort((a, b) => b.dateadded!.compareTo(a.dateadded!));
  }

  void addNote(NotesModel note) {
    notes.add(note);
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(NotesModel note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    // sortNode();
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(NotesModel note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    sortNode();
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNote() async {
    notes = await ApiService.fetchNote();
    isLoading = false;
    sortNode();
    notifyListeners();
  }
}
