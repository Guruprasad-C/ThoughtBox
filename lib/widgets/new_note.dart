import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/widgets/note.dart';
import 'package:notes/widgets/notes_provider.dart';
import 'package:provider/provider.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dateTime = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('New Note'),
          backgroundColor: Color.fromARGB(255, 222, 209, 37),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_titleController.text.trim().isEmpty &&
                _noteController.text.trim().isEmpty) {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Invalid Note'),
                  content: Text('Enter either title or note to save it.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Okay'),
                    ),
                  ],
                ),
              );
              return;
            } else if (_titleController.text.trim().isEmpty &&
                _noteController.text.trim().isNotEmpty) {
              value.addNote(
                Note(
                  title: _noteController.text,
                  note: _titleController.text,
                  date: DateTime.now(),
                ),
              );
            } else {
              value.addNote(
                Note(
                  title: _titleController.text,
                  note: _noteController.text,
                  date: DateTime.now(),
                ),
              );
            }
            Navigator.pop(context);
          },
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 237, 237, 34),
          child: Icon(Icons.done, size: 30, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dateTime),
              SizedBox(height: 15),
              TextField(
                controller: _titleController,
                maxLength: 100,
                decoration: InputDecoration(
                  labelText: "Heading",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _noteController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter your content here...",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
