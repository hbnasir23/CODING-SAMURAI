import 'package:flutter/material.dart';
import 'note.dart';
import 'note_detail.dart';
import 'note_form.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffbee8e5),
        title: Text(
          'Keep Notez',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          String contentSnippet = notes[index].content.length > 50
              ? notes[index].content.substring(0, 50) + '...'
              : notes[index].content;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetail(
                    note: notes[index],
                    onUpdate: (updatedNote) {
                      setState(() {
                        notes[index] = updatedNote;
                      });
                    },
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notes[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              notes.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        contentSnippet,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteForm(
                onSave: (note) {
                  setState(() {
                    notes.add(note);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
