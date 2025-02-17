// Create a ListView.builder that displays a list of names. If a name starts with the letter ‘A’, it should be displayed with a green color; otherwise, it should be displayed in red.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameListScreen(),
    );
  }
}

class NameListScreen extends StatelessWidget {
  final List<String> names = [
    'Alice', 'Bob', 'Andrew', 'Charlie', 'Angela', 'David', 'Amanda', 'Eve', 'Albert', 'Frank'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Names List')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              names[index],
              style: TextStyle(
                color: names[index].startsWith('A') ? Colors.green : Colors.red,
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}
