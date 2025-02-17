import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewScreen()
    );
  }
}

class GridViewScreen extends StatelessWidget{
  final List<String> items = List.generate(20, (index) => "This is ${index + 1}");
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text("GridView Example")
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Item selected"),
                        content: Text("You tapped on ${items[index]}"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OKAY")
                          )
                        ],
                      )
                  );
                },
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ),
              );
            })
    );
  }
}
