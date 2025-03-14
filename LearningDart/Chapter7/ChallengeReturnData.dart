import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Color Selection App",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _backgroundColor = Colors.white;

  void _selectColor() async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorSelectionScreen())
    );

    if (selectedColor != null){
      setState(() {
        _backgroundColor = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _selectColor,
          child: Text('Select Color'),
        ),
      ),
    );
  }
}


class ColorSelectionScreen extends StatelessWidget {
  final List<Color> colors = [
    Colors.red, Colors.green, Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick a color"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemCount: colors.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.pop(context, colors[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          );
        },
      ),
    );
  }
}
