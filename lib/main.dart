import 'package:flutter/material.dart';
import 'package:notes/notes.dart';
import 'package:notes/widgets/notes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NotesProvider())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Notes()),
    ),
  );
}
