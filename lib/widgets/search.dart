import 'package:flutter/material.dart';
import 'package:notes/widgets/notes_list/notes_item.dart';
import 'package:notes/widgets/notes_provider.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: "Search notes...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final query = _searchController.text.toLowerCase();
              final results = value.registeredNotes
                  .where(
                    (note) =>
                        note.title.toLowerCase().contains(query) ||
                        note.note.toLowerCase().contains(query),
                  )
                  .toList();
              _searchController.clear();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Search Results"),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: results.isEmpty
                          ? Text("No notes found.")
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: results.length,
                              itemBuilder: (context, index) {
                                final note = results[index];
                                return NotesItem(note: note);
                              },
                            ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
