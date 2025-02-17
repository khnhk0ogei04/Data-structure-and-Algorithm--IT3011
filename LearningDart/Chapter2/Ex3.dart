// Display a list of numbers from 1 to 50. Each number should be shown in a separate list item.
import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewScreen(),
    );
  }
}

class ListViewScreen extends StatelessWidget{
  final List<String> items = List.generate((50), (index) => "Item ${index + 1}");
  @override
  Widget build (BuildContext context){
    return Scaffold (
      appBar: AppBar(
        title: Text("Simple ListView")
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(items[index]),
          );
        }
      )
    );
  }
}
