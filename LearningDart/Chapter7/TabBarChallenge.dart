import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TaskHomePage extends StatefulWidget {
  @override
  _TaskHomePageState createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<String> activeTasks = ["Task 1", "Task 2", "Task 3"];
  List<String> completedTasks = ["Task 4", "Task 5"];

  void moveToCompleted(int index) {
    setState(() {
      completedTasks.add(activeTasks.removeAt(index));
    });
  }

  void moveToActive(int index) {
    setState(() {
      activeTasks.add(completedTasks.removeAt(index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Task Manager"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Active'),
              Tab(icon: Icon(Icons.check_circle), text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: activeTasks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(activeTasks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => moveToCompleted(index),
                ),
              ),
            ),
            ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(completedTasks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.undo),
                  onPressed: () => moveToActive(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
