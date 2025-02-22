// Create a multi-step form in Flutter where each step is a different page in a PageView. Include ‘Next’ and ‘Previous’ buttons to navigate between the steps.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi-Step Form Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MultiStepForm(),
    );
  }
}

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose(){
    _pageController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _nextPage(){
    if (_formKey.currentState!.validate()){
      if (_currentStep < 2){
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn
        );
        setState(() {
          _currentStep += 1;
        });
      } else {
        _submitForm();
      }
    }
  }

  void _previousPage(){
    if (_formKey.currentState!.validate()){
      if (_currentStep > 0){
        _pageController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn
        );
        setState(() {
          _currentStep -= 1;
        });
      }
    }
  }

  void _submitForm(){
    String name = _nameController.text;
    String age = _ageController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Form submitted!"),
          content: Text(
                'Name: $name\n'
                'Age: $age\n'
                'Email: $email\n'
                'Phone: $phone',
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  _pageController.jumpToPage(0);
                  setState(() {
                    _currentStep = 0;
                  });
                  _nameController.clear();
                  _ageController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                },
              child: const Text("OKAY"),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi-Step form"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: (_currentStep + 1) / 3,
              minHeight: 8,
            ),
            SizedBox(height: 16),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Step 1: Personal Info",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Name"
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Please enter your name...";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            labelText: "Age",
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) <= 0) {
                              return 'Please enter a valid age';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Step 2: Contact Info',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email"
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Please enter your email...";
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: "Phone Number"
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return "Please enter your phone number";
                            }
                            if (!RegExp(r"^\d{10}$").hasMatch(value)){
                              return "Please enter a valid 10-digits phone number";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Step 3: Confirmation",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                              'Name: ${_nameController.text}\n'
                              'Age: ${_ageController.text}\n'
                              'Email: ${_emailController.text}\n'
                              'Phone: ${_phoneController.text}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _currentStep > 0 ? _previousPage : null,
                    child: const Text(
                      "Previous"
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _nextPage,
                    child: Text(_currentStep < 2 ? 'Next' : 'Submit'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
