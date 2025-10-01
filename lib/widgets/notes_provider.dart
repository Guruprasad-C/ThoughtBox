import 'package:flutter/material.dart';
import 'package:notes/widgets/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> registeredNotes = [
    Note(
      title: 'Home Work',
      note: 'I have done my homework',
      date: DateTime.now(),
    ),
    Note(
      title: 'College',
      note: 'Finish the before night',
      date: DateTime.now(),
    ),
  ];

  void addNote(Note note) {
    registeredNotes.add(note);
    notifyListeners();
  }

  void updateNote(
    TextEditingController titleControl,
    TextEditingController noteControl,
    Note note,
  ) {
    int curIndex = registeredNotes.indexOf(note);

    registeredNotes[curIndex] = Note(
      title: titleControl.text,
      note: noteControl.text,
      date: DateTime.now(),
    );
    notifyListeners();
  }

  void removeData(Note note) {
    int curInd = registeredNotes.indexOf(note);
    registeredNotes.removeAt(curInd);
    notifyListeners();
  }

  void undoNote(int index, Note note) {
    registeredNotes.insert(index, note);
    notifyListeners();
  }
}
