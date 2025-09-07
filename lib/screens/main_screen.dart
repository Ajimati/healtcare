// screens/main_screen.dart
import 'package:flutter/material.dart';

import 'input_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heart Disease Predictor',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape:const  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              onPressed: () => Navigator.pushNamed(
                  context, '/input'), // Navigate to input screen,
              child: Text('Start Predicting'),
            ),
          ),
        ),
      ),
    );
  }
}

//            onPressed: () => Navigator.pushNamed(
//                 context, '/input'), // Navigate to input screen
