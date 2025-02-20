import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan
      ),
      home: FormScreen()
    );
  }
}

class FormScreen extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("USER FORM"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(_nameController, "Name", Icons.person),
              SizedBox(height: 10),
              _buildTextField(_emailController, "Email", Icons.email),
              SizedBox(height: 10),
              _buildTextField(_phoneController, "Phone", Icons.phone),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Form Submitted Successfully"))
                    );
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      )
    );
  }
}

Widget _buildTextField(
  TextEditingController controller, String hint, IconData icon
){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blue),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none
      )
    ),
    validator: (value){
      if (value == null || value.isEmpty){
        return "Please enter your $hint";
      }
      return null;
    },
  );
}
