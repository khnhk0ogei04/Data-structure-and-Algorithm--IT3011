import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi-Page form demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: "/step1",
      routes: {
        "/step1": (context) => const Step1Screen(),
        "/step2": (context) => const Step2Screen(),
        "/step3": (context) => const Step3Screen()
      },
    );
  }
}

class FormData{
  String name = "";
  String email = "";
  String address = "";
  String city = '';
  String zipCode = '';
  Map<String, String> toMap(){
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'zipCode': zipCode,
    };
  }
}

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = FormData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 1 - Personal Info"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Please enter your name..." : null,
                onSaved: (value) => _formData.name = value!,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? "Please enter your email..." : null,
                onSaved: (value) => _formData.email = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, "/step2", arguments: _formData);
                  }
                },
                child: const Text("Next"),
              )
            ],
          ),
        ),
      )
    );
  }
}

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final FormData formData = ModalRoute.of(context)!.settings.arguments as FormData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 2 - Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Address"),
                validator: (value) => value!.isEmpty ? "Please enter your address..." : null,
                onSaved: (value) => formData.address = value!,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(labelText: "City"),
                validator: (value) => value!.isEmpty ? "Please enter your address..." : null,
                onSaved: (value) => formData.city = value!,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Zip Code"
                ),
                validator: (value) => value!.isEmpty ? 'Please enter your zip code' : null,
                onSaved: (value) => formData.zipCode = value!,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        Navigator.pushNamed(
                          context,
                          "/step3",
                          arguments: formData
                        );
                      }
                    },
                    child: const Text("Next")
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}

class Step3Screen extends StatelessWidget {
  const Step3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final FormData formData = ModalRoute.of(context)!.settings.arguments as FormData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 3 - Confirmation"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please review your information:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Name: ${formData.name}"),
            Text("Email: ${formData.email}"),
            Text('Address: ${formData.address}'),
            Text('City: ${formData.city}'),
            Text('Zip Code: ${formData.zipCode}'),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(""
                            "Form submitted successfully"),
                        duration: Duration(seconds: 1),
                      )
                    );
                  },
                  child: const Text("Submit"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

