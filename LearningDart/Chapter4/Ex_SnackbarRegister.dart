import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Snackbar Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar Demo"),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Account Create Successfully"),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 5),
              )
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: const Text(
              "REGISTER",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ),
    );
  }
}
