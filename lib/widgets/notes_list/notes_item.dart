import 'package:flutter/material.dart';
import 'package:notes/widgets/note.dart';
import 'package:notes/widgets/note_view.dart';

class NotesItem extends StatefulWidget {
  const NotesItem({required this.note, super.key});

  final Note note;

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteView(note: widget.note),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    widget.note.formater,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      widget.note.note,
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
