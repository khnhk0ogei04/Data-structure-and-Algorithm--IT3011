import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              "ListView Demo",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
             ),
          ),
        body: ListView(
          reverse: true,
          children: const [
            ListTile(
              title: Text('Go to Gym'),
              subtitle: Text('Go to Gym at 6:00 AM'),
            ),
            ListTile(
              title: Text('Go to College'),
              subtitle: Text('Go to College at 8:00 AM'),
            ),
            ListTile(
              title: Text('Go to Office'),
              subtitle: Text('Go to Office at 11:00 AM'),
            ),
            // Add more ListTiles as needed
          ],
        ),
      ),
    );
  }
}
