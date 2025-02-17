import "package:flutter/material.dart";

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false, home: TodoListScreen());
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

void main() {
  runApp(TodoApp());
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Enter a todo",
                          border: OutlineInputBorder(),
                        ))),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _addTodo,
                    child: Text("Add",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold))),
              ],
            )),
        
        Expanded(
          child: ListView.builder(
            itemCount: _todos.length,
            itemBuilder: (BuildContext context, int index){
              return Dismissible(
                key: Key(_todos[index]),
                onDismissed: (direction) => _removeTodo(index),
                background: Container(color: Colors.red),
                child: Card(
                  color: Colors.blueAccent,
                  child: ListTile(
                    title: Text(_todos[index])
                  )
                )
              );
            }
          )
        )
      ]),
    );
  }
}
