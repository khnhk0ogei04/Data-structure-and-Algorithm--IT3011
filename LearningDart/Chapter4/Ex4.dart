// Ex4: Design a form with validation that includes fields for user registration: username, password, confirm password, and email. Display appropriate error messages for invalid inputs. Construct a dynamic form in Flutter that adds a new text field every time the user presses an ‘Add’ button. Include a ‘Submit’ button to display all entered data in a dialog box.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Register App Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const RegistrationForm()
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final List<TextEditingController> _extraFieldControllers = [];

  void _addNewField(){
    setState(() {
      _extraFieldControllers.add(TextEditingController());
    });
  }

  void _submitForm(){
    if (_formKey.currentState!.validate()){
      String username = _usernameController.text;
      String password = _passwordController.text;
      String email = _emailController.text;
      List<String> extraFields = [];
      for (var controller in _extraFieldControllers){
        extraFields.add(controller.text);
      }
      // Prepare dialog content
      String dialogContent = 'Username: $username\n'
          'Password: $password\n'
          'Email: $email\n'
          'Extra Fields:\n${extraFields.isEmpty ? "None" : extraFields.join("\n")}';

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Submitted Data"),
            content: Text(dialogContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                    "OK",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
      );
    }
  }

  @override
  void dispose(){
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    for (var _controller in _extraFieldControllers){
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("REGISTER FORM"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username...",
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Please enter a username";
                    }
                    if (value.length < 6){
                      return 'Username must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password"
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Confirm Password"
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                  SizedBox(height: 16),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ..._extraFieldControllers.map((_controller){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(labelText: 'Extra Field'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 16),
                ElevatedButton(
                    onPressed: _addNewField,
                    child: const Text("Add field")
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: _submitForm, child: const Text("SUBMIT"))
              ],
            )
          ),
        ),
      )
    );
  }
}
