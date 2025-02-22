import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercise()
    );
  }
}

class Exercise extends StatefulWidget{
  const Exercise({super.key});
  
  @override
  State<Exercise> createState() => _ExerciseState(); 
}

class _ExerciseState extends State<Exercise>{
  int _selectedMenu = 0;
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons In Flutter")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupMenuButton<int>(
              onSelected: (int value){
               setState((){
                 _selectedMenu = value;
               }); 
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('About Us'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Contact Us'),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text('Privacy Policy'),
                )
              ]
            ),
            SizedBox(height: 16),
            Text(
              _selectedMenu == 0 ? "Not chosen" : "Chosen"
            )
          ]
        )
      )
    );
  }
}
