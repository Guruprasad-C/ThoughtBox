import 'package:flutter/material.dart';
import 'package:notes/widgets/note.dart';
import 'package:intl/intl.dart';
import 'package:notes/widgets/notes_provider.dart';
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  const NoteView({required this.note, super.key});

  final Note note;

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late TextEditingController _titleControl;
  late TextEditingController _noteControl;
  late String dateTime;

  @override
  void initState() {
    super.initState();
    _titleControl = TextEditingController(text: widget.note.title);
    _noteControl = TextEditingController(text: widget.note.note);
    dateTime = DateFormat('yyyy-MM-dd – kk:mm').format(widget.note.date);
  }

  @override
  void dispose() {
    _titleControl.dispose();
    _noteControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.note.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.amberAccent,
          actions: [
            IconButton(
              onPressed: () {
                int curInd = value.registeredNotes.indexOf(widget.note);
                value.removeData(widget.note);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Note Deleted"),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        value.undoNote(curInd, widget.note);
                      },
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.updateNote(_titleControl, _noteControl, widget.note);
            Navigator.pop(context);
          },
          shape: CircleBorder(),
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.done, size: 30, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dateTime),
              SizedBox(height: 15),
              TextField(
                controller: _titleControl,
                maxLength: 100,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _noteControl,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
