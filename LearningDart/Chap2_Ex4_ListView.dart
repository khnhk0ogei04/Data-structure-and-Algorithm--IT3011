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

class ListViewScreen extends StatefulWidget{
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}
  
 class _ListViewScreenState extends State<ListViewScreen>{
   final List<String> items = List.generate(10, (index) => "Item ${index + 1}");
   
   @override
   Widget build (BuildContext context){
     return Scaffold(
      appBar: AppBar(
        title: Text("Simple ListView"),
      ),
       body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          String _text = items[index];
          return ListTile(
            title: Text(items[index]),
            subtitle: Text("This is item: $_text")
          );
        },
       )
     );
   }
 }
