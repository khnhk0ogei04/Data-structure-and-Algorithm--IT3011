import "package:flutter/material.dart";
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student Grade Table")
        ),
        body: DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Subject")),
            DataColumn(label: Text("Grade"))
          ],
          rows: const[
            DataRow(
              cells: [
                DataCell(Text("Alice")),
                DataCell(Text("Math")),
                DataCell(Text("A")),
              ]
            ), 
            DataRow(cells: [
              DataCell(Text('Bob')),
              DataCell(Text('Science')),
              DataCell(Text('B+')),
            ]),
          ]
        )
      )
    );
  }
}
