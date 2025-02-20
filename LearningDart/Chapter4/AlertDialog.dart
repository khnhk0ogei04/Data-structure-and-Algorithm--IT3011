import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Gọi ứng dụng Flutter
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exit App Dialog Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showMyAlertDialog(context),
          child: const Text("EXIT APP"),
        ),
      )
    );
  }
}

void showMyAlertDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Are you sure you want to exit?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("OK"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
