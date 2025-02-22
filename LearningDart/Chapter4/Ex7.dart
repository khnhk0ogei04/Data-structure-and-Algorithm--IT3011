import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Custom Button Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const SimpleCustomButton()
    );
  }
}

class SimpleCustomButton extends StatefulWidget {
  const SimpleCustomButton({super.key});

  @override
  State<SimpleCustomButton> createState() => _SimpleCustomButtonState();
}

class _SimpleCustomButtonState extends State<SimpleCustomButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Custom Button")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPressed ? Colors.blue.shade700 : Colors.blue,
            elevation: _isPressed ? 2 : _isHovered ? 10 : 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            minimumSize: Size(200, 60)
          ),
          onHover: (value) {
            setState(() {
              _isHovered = value;
            });
          },
          child: const Text(
            "Press Me",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}




