import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopupDemo(),
    );
  }
}

class PopupDemo extends StatefulWidget {
  const PopupDemo({super.key});

  @override
  State<PopupDemo> createState() => _PopupDemoState();
}

class _PopupDemoState extends State<PopupDemo> {
  int _selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Button in flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton<int>(
                onSelected: (int result){
                  setState(() {
                    _selectedMenu = result;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("You choose $_selectedMenu"),
                      duration: Duration(seconds: 3),
                    )
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text("About us"),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone
                      ),
                      title: Text("Contact us"),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text('Privacy Policy'),
                    ),
                  )
                ],

              )
            ],
          ),
        )
    );
  }
}
