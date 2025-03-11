import 'package:flutter/material.dart';

void main() => runApp(SimpleInterestApp());

class SimpleInterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator',
      home: InterestCalculatorScreen(),
    );
  }
}

class InterestCalculatorScreen extends StatefulWidget {
  @override
  _InterestCalculatorScreenState createState() => _InterestCalculatorScreenState();
}

class _InterestCalculatorScreenState extends State<InterestCalculatorScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest Calculator')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField(principalController, 'Principal'),
            _buildTextField(rateController, 'Rate of Interest'),
            _buildTextField(timeController, 'Time in Years'),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: _calculateInterest,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }

  void _calculateInterest() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    double time = double.tryParse(timeController.text) ?? 0.0;

    double interest = principal * rate * time / 100;

    setState(() {
      result = 'Simple Interest: \$${interest.toStringAsFixed(2)}';
    });
  }
}
