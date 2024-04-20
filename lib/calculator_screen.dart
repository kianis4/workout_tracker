import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  double? _oneRepMax;

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Rep Max Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Here is a tool for calculating one rep max",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: "Enter Weight lifted",
                labelText: "Weight",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _repsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: "Enter Reps",
                labelText: "Reps",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateMax,
              child: const Text("Calculate One Rep Max"),
            ),
            if (_oneRepMax != null)
              Text(
                "One Rep Max: $_oneRepMax",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }

  void _calculateMax() {
    if (_weightController.text.isEmpty || _repsController.text.isEmpty) {
      // Handle empty fields
      return;
    }

    final int weight = int.parse(_weightController.text);
    final int reps = int.parse(_repsController.text);

    setState(() {
      _oneRepMax = weight / (1.0278 - 0.0278 * reps);
    });
  }
}
