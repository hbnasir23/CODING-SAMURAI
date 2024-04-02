// NoteForm.dart
import 'package:flutter/material.dart';
import 'note.dart';

class NoteForm extends StatefulWidget {
  final Note? note;
  final Function(Note) onSave;

  NoteForm({this.note, required this.onSave});

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title);
    _contentController = TextEditingController(text: widget.note?.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbee8e5),
      appBar: AppBar(
        backgroundColor: Color(0xffbee8e5),
        title: Text(
          'Add Notes',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                labelStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
            widget.onSave(
              Note(
                _titleController.text,
                _contentController.text,
              ),
            );
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Incomplete Fields"),
                  content: Text("Please fill in all the fields."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
