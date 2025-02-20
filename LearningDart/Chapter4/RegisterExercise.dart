import 'package:flutter/material.dart';
void main() {
  runApp(MyApp()); // Gọi ứng dụng Flutter
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage()
    );
  }
}

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog Example")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Successfully"),
                    content: Text("Account created successfully"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text("OKE"),
                      )
                    ],
                  );
                }
            );
          },
          child: const Text("Show Custom Alert Dialog"),
        ),
      ),
    );
  }
}
