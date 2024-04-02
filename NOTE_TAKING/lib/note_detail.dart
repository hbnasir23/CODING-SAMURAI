import 'package:flutter/material.dart';
import 'note.dart';
import 'note_form.dart';

class NoteDetail extends StatelessWidget {
  final Note note;
  final Function(Note) onUpdate;

  NoteDetail({required this.note, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(note.content),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteForm(
                note: note,
                onSave: (editedNote) {
                  onUpdate(editedNote); // Update the note
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
