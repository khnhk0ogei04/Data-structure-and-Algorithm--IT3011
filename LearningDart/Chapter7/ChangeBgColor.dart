import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Selector App',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _bgColor = Colors.white;

  void _navigateAndSelectColor() async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ColorSelectionScreen()),
    );

    if (selectedColor != null) {
      setState(() {
        _bgColor = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: _navigateAndSelectColor,
          child: const Text('Select a Color'),
        ),
      ),
    );
  }
}

class ColorSelectionScreen extends StatelessWidget {
  const ColorSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Color')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text('Red'),
            leading: const Icon(Icons.circle, color: Colors.red),
            onTap: () => Navigator.pop(context, Colors.red),
          ),
          ListTile(
            title: const Text('Blue'),
            leading: const Icon(Icons.circle, color: Colors.blue),
            onTap: () => Navigator.pop(context, Colors.blue),
          ),
          ListTile(
            title: const Text('Green'),
            leading: const Icon(Icons.circle, color: Colors.green),
            onTap: () => Navigator.pop(context, Colors.green),
          ),
        ],
      ),
    );
  }
}
