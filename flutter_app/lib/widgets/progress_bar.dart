import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  ProgressBar({required this.currentQuestion, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: currentQuestion / totalQuestions,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            minHeight: 10,
          ),
          SizedBox(height: 10),
          Text(
            'Question $currentQuestion of $totalQuestions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Ensured visibility
          ),
        ],
      ),
    );
  }
}
  