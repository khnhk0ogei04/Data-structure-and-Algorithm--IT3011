import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyanAccent
      ),
      home: NestedListViewScreen(),
    );
  }
}

class NestedListViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nested ListView"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int outerIndex){
          return Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Outer Item ${outerIndex + 1}"),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, innerIndex){
                        return ListTile(
                          title: Text("Inner Item ${innerIndex + 1}"),
                          subtitle: Text("Subtitle of item ${innerIndex + 1}")
                        );
                      },
                    )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
