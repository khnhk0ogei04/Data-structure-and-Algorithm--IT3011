import 'package:flutter/material.dart';

void main() => runApp(MyTodoApp());

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      title: Text('Todo App'),
      bottom: TabBar(
        tabs: [
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        Center(
          child: ListView(
            children: [
              ListTile(title: Text("Task 1"), leading: Icon(Icons.info)),
              ListTile(title: Text("Task 2"), leading: Icon(Icons.info))
            ],
          )
        ),
        Center(
          child: ListView(
            children: [
              ListTile(title: Text("Task 3"), leading: Icon(Icons.info)),
              ListTile(title: Text("Task 4"), leading: Icon(Icons.info))
            ],
          )
        ),
      ]
    ),
  ),
),
    );
  }
}
