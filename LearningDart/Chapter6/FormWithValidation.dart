import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Forms",
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name...",
                  hintText: "Enter your first name..."
                ),
                validator: (value){
                  if (value == ""){
                    return "Please enter your first name...";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Last Name...",
                  hintText: "Enter your last name"
                ),
                validator: (value){
                  if (value == ""){
                    return "Please enter your last name...";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Hello, Form submitted"),
                        duration: Durations.short1,
                      )
                    );
                  }
                },
                child: Text("SUBMIT"),
              )
            ],
          ),
        ),
      )
    );
  }
}
