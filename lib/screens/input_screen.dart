// screens/input_screen.dart
import 'package:flutter/material.dart';
import '../main.dart';
import 'output_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final List<TextEditingController> controllers =
      List.generate(13, (_) => TextEditingController());

  final List<String> featureLabels = [
    'Age',
    'Sex (1=male, 0=female)',
    'Chest Pain Type (0-3)',
    'Resting Blood Pressure',
    'Serum Cholesterol (mg/dl)',
    'Fasting Blood Sugar (>120 mg/dl, 1=true, 0=false)',
    'Resting ECG Results (0-2)',
    'Maximum Heart Rate Achieved',
    'Exercise Induced Angina (1=yes, 0=no)',
    'ST Depression Induced by Exercise',
    'Slope of the Peak Exercise ST Segment (0-2)',
    'Number of Major Vessels (0-3)',
    'Thalassemia (1=normal; 2=fixed defect; 3=reversible defect)'
  ];

  void submitData() {
    try {
      final inputs =
          controllers.map((c) => double.parse(c.text)).toList(); // Parse inputs
      if (inputs.length != 13) throw Exception("Enter all 13 values");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OutputScreen(
              data: HeartData(inputs)), // Pass data via constructor
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter valid numbers for all fields")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Enter Patient Data',
          style: TextStyle( fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 13,
                itemBuilder: (context, index) => TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: featureLabels[index]),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: submitData, // Trigger prediction
                child: Text('Predict'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
