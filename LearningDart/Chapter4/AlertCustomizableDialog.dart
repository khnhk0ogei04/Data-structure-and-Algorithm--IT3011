import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Gọi ứng dụng Flutter
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AlertDialog 02",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Alert Dialogs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showMyAlertDialog(context, "Custom Title",
                  'This is a customizable alert dialog.'
              ),
              child: const Text("Customizable Alert"),
            )
          ],
        ),
      ),
    );
  }
}

void showMyAlertDialog(BuildContext context, String title, String content){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text("OK")
            )
          ],
        );
      });
}
