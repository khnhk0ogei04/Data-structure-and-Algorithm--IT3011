import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/*
Create a TextFormField for user feedback that includes validation to ensure the input is at least 15 characters long. Style the field with a rounded border and include a prefix icon that represents communication.
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Feedback Form",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FeedbackScreen()
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Feedback submitted successfully!")),
      );
      _feedbackController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "USER FEEDBACK",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(
                  labelText: "Your feedback",
                  hintText: "Enter at least 15 characters",
                  prefixIcon: Icon(Icons.chat),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  )
                ),
                maxLines: 3,
                validator: (value){
                  if (value == null || value.trim().length < 15){
                    return "Feedback must be at least 15 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  child: Text("SUBMIT"),
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}
