import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizza Selection App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedPizza;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Select Pizza"),
              onPressed: () async {
                final selectedPizza = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PizzaSelectionScreen())
                );
                if (selectedPizza != null){
                  setState(() {
                    _selectedPizza = selectedPizza as String;
                  });
                }
              }
            ),
            SizedBox(height: 20),
            Text("Selected Pizza: $_selectedPizza")
          ]
        ),
      )
    );
  }
}

class PizzaSelectionScreen extends StatelessWidget {
  const PizzaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Pizza"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Margherita"),
            subtitle: Text("Option 1"),
            onTap: (){
              Navigator.of(context).pop("Margherita");
            },
          ),
          ListTile(
            title: Text('Pepperoni'),
            subtitle: Text("Option 2"),
            onTap: () {
              Navigator.of(context).pop('Pepperoni');
            },
          ),
          ListTile(
            title: Text('Vegetarian'),
            subtitle: Text("Option 3"),
            onTap: () {
              Navigator.of(context).pop('Vegetarian');
            },
          )
        ],
      )
    );
  }
}


