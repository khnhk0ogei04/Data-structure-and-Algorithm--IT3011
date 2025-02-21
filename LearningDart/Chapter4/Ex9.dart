// Create a sign-in form in Flutter with animated transitions between the ‘Sign In’ and ‘Sign Up’ forms, showcasing a smooth user experience.
//
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp()); // Gọi ứng dụng Flutter
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen()
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isSignIn ? "Sign In" : "Sign up",
                  style: TextStyle(fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20),
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: _isSignIn
                        ? buildSignInForm(context)
                        : buildSignUpForm(context)
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: (){
                    setState(() {
                      _isSignIn = !_isSignIn;
                    });
                  },
                  child: Text(
                    _isSignIn ? "Don't have an account? Sign Up" : "Already have an account? Sign In",
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

Widget buildSignInForm(BuildContext context){
  return Container(
    key: ValueKey(1),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField("Email"),
        SizedBox(height: 10),
        buildTextField("Password", isPassword: true),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login Successfully"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: Text("SIGN IN")
        )
      ],
    ),
  );
}

Widget buildSignUpForm(BuildContext context){
  return Container(
    key: ValueKey(2),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField("Full Name"),
        SizedBox(height: 10),
        buildTextField("Email"),
        SizedBox(height: 10),
        buildTextField("Password"),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Sign up successfully"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                )
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal
            ),
            child: Text(
              "SIGN UP"
            ),
        )
      ],
    ),
  );
}

Widget buildTextField(String label, {bool isPassword = false}){
  return TextField(
    obscureText: isPassword,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.blueGrey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      )
    ),
  );
}
