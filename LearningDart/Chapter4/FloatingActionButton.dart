// Challenge
// Create floating action button which change its background color from green to red when pressed.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGreen = true;

  void _toggleColor() {
    setState(() {
      isGreen = !isGreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floating Action Button')),
      body: Center(child: Text('Press the FAB to change color')),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        backgroundColor: isGreen ? Colors.green : Colors.red,
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
