import 'package:flutter/material.dart';
import 'package:notes/widgets/note.dart';
import 'package:notes/widgets/notes_list/notes_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({required this.notes, super.key});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      itemBuilder: (context, index) => NotesItem(note: notes[index]),
      separatorBuilder: (context, index) => SizedBox(height: 4),
    );
  }
}
