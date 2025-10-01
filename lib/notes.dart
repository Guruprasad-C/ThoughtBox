import 'package:flutter/material.dart';
import 'package:notes/widgets/new_note.dart';
import 'package:notes/widgets/notes_list/notes_list.dart';
import 'package:notes/widgets/notes_provider.dart';
import 'package:notes/widgets/search.dart';
import 'package:provider/provider.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Notes App',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Color.fromARGB(255, 222, 209, 37),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "${value.registeredNotes.length} Notes",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              Search(),
              SizedBox(height: 20),
              Expanded(child: NotesList(notes: value.registeredNotes)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewNote()),
            );
          },
          backgroundColor: const Color.fromARGB(255, 237, 237, 34),
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
