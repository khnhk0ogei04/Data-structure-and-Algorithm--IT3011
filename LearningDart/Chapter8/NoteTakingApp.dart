import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoteScreen()
    );
  }
}

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController _noteController = TextEditingController();
  List<String> notes = [];

  @override
  void initState(){
    super.initState();
    _loadNotes();
  }

  Future<File> _getNoteFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/notes.txt");
  }

  Future<void> _loadNotes() async{
    try {
      final file = await _getNoteFile();
      if (await file.exists()){
        List<String> savedNotes = await file.readAsLines();
        setState(() {
          notes = savedNotes;
        });
      }
    } catch (error) {
      print("Error reading notes: $error");
    }
  }

  Future<void> _writeToFile() async{
    final file = await _getNoteFile();
    await file.writeAsString(notes.join("\n"));
  }

  Future<void> _deleteNote(int index) async{
    setState(() {
      notes.removeAt(index);
    });
    await _writeToFile();
  }

  Future<void> _saveNote() async{
    if (_noteController.text.trim().isEmpty){
      return;
    }
    setState(() {
      notes.add(_noteController.text);
    });
    _noteController.clear();
    await _writeToFile();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Add new note successfully"),
        duration: Duration(seconds: 2),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note-Taking App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: "Write a note",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text("Save Note"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(notes[index]),
                      trailing: IconButton(
                        onPressed: () => _deleteNote(index),
                        icon: Icon(Icons.delete)
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
