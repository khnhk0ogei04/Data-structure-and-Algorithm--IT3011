import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Challenge Contact Form",
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: ContactFormPage()
    );
  }
}

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  String submittedData = "";

  @override
  void dispose(){
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email){
    return email.contains("@");
  }

  void _submitForm(){
    if (_formKey.currentState!.validate()){
      setState((){
        'Name: ${_nameController.text}\nPhone: ${_phoneController.text}\nEmail: ${_emailController.text}';
      });
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Challenge",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Please enter your name...";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Please enter your phone number";
                  }
                  if (value.length != 10 && RegExp(r'^d{10}$').hasMatch(value)){
                    return 'Phone number must be exactly 10 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Submit"),
                ),
              ),
              SizedBox(height: 20),
              if (submittedData.isNotEmpty)
                Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      submittedData,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
            ],
          ),
        )
      ),
    );
  }
}
