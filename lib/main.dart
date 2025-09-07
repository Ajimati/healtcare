// main.dart
import 'package:flutter/material.dart';
import 'package:hrt_failure_prediction/screens/input_screen.dart';
import 'package:hrt_failure_prediction/screens/main_screen.dart';

void main() {
  runApp(HeartDiseaseApp());
}

class HeartDiseaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heart Disease Predictor',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue, // Set primary color to blue
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/input': (context) => InputScreen(),
      },
    );
  }
}

// models/heart_data.dart
class HeartData {
  final List<double> features; // 13 input features from user
  HeartData(this.features);
}