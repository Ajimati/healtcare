
// screens/output_screen.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../main.dart';

class OutputScreen extends StatelessWidget {
  final HeartData data; // Received data from InputScreen
  OutputScreen({required this.data});

  int predict(List<double> inputs) {
    // Logistic regression coefficients (from Python)
    const List<double> coef = [0.00240666, -1.58041324, 0.70682576, -0.0193538, -0.00413697, -0.00655428,
      0.42872931, 0.01482948, -0.87427306, -0.60689819, 0.47778888, -0.90074108, -0.89428485];
    const double intercept = 4.452415773128358;

    double z = intercept + List.generate(inputs.length, (i) => coef[i] * inputs[i]).reduce((a, b) => a + b);
    double probability = 1 / (1 + (1 / (z.exp()))); // Sigmoid function

    return probability >= 0.5 ? 1 : 0; // 1 = disease, 0 = healthy
  }

  @override
  Widget build(BuildContext context) {
    final result = predict(data.features); // Get prediction result
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          title: Text('Prediction Result', style: TextStyle( fontWeight: FontWeight.w600),),),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 36,
          height: MediaQuery.of(context).size.height/4,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
          ),

          child: Center(
            child: Text(
              result == 1 ? "Patient HAS heart disease." : "Patient does NOT have heart disease.",
              style: TextStyle(fontSize: 22, color: Colors. white,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// extensions/num_extensions.dart (optional to add .exp method)
extension Exponential on num {
  double exp() => math.exp(this);
}
