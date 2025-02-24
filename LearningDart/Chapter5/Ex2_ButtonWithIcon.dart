import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoButton()
    );
  }
}

class DemoButton extends StatefulWidget {
  const DemoButton({super.key});

  @override
  State<DemoButton> createState() => _DemoButtonState();
}

class _DemoButtonState extends State<DemoButton> {
  int _selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eg2: Button in Flutter")
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PopupMenuButton<int>(
              onSelected: (int value){
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("You choose menu: $_selectedMenu"),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.green,
                    )
                  );
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About us"),
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Contact us")
                  )
                ),
                const PopupMenuItem(
                  value: 3,
                  child: ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text("Privacy Policy")
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
