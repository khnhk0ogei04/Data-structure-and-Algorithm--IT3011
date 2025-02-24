// Create a popup menu button that shows options for changing the theme of the app (Light, Dark, System Default).
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ThemeChanger(),
    );
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  bool _isDark = false; // false = Light, true = Dark

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDark ? ThemeData.dark() : ThemeData.light(), // Chọn theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Change Theme"),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String choice) { // Khi chọn menu
                setState(() {
                  if (choice == "Light") _isDark = false;
                  if (choice == "Dark") _isDark = true;
                  if (choice == "System") {
                    _isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
                  }
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: "Light", child: Text("Light")),
                const PopupMenuItem(value: "Dark", child: Text("Dark")),
                const PopupMenuItem(value: "System", child: Text("System")),
              ],
              icon: const Icon(Icons.settings), // Icon nút menu
            ),
          ],
        ),
        body: const Center(
          child: Text("Hello, change the theme!"),
        ),
      ),
    );
  }
}
