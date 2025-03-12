import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greet App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            ElevatedButton(
              child: const Text('Greet'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GreetScreen(name: _controller.text),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GreetScreen extends StatelessWidget {
  final String name;

  const GreetScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Greet Screen")),
      body: Center(child: Text('Hello, $name!')),
    );
  }
}
