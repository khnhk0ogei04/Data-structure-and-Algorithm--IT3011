import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DropdownScreen(),
    );
  }
}

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  String? _selectedItem; // Initially null, no item selected

  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  void _onItemSelected(String? newValue) {
    setState(() {
      _selectedItem = newValue;
    });
    // Show SnackBar with the selected item
    if (newValue != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected: $newValue'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Button Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButton<String>(
            value: _selectedItem,
            hint: const Text('Select an item'), 
            onChanged: _onItemSelected,
            items: _items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
