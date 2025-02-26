import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Forms",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Row(
            children: [
              Checkbox(
                  value: _isChecked, 
                  onChanged: (bool? value){
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  ),
              Text("I accept the agreement")
            ],
          ),
        ),
      ),
    );
  }
}
