import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GymApp(),
    );
  }
}

class GymApp extends StatefulWidget {
  const GymApp({super.key});

  @override
  State<GymApp> createState() => _GymAppState();
}

class _GymAppState extends State<GymApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Center(
      child: Text("Home Screen", style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text('Workouts Screen', style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text("Profile Screen", style: TextStyle(fontSize: 24)),
    ),
    Center(
      child: Text('Settings Screen', style: TextStyle(fontSize: 24))
    )
  ];

  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void _onChoose(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gym App")
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationItems,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onChoose,
      ),
    );
  }
}
