import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

  String _getMessage() {
    double percentage = (score / totalQuestions) * 100;
    if (percentage == 100) {
      return 'Perfect! 🎉 You nailed it!';
    } else if (percentage >= 75) {
      return 'Great job! 👍 Keep it up!';
    } else if (percentage >= 50) {
      return 'Good effort! 😊 Try again to improve.';
    } else {
      return 'Keep trying! 💪 Practice makes perfect.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],  // Updated color scheme
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getMessage(),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Score:',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$score / $totalQuestions',
                        style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text('Try Again', style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => QuizScreen()), // Restarts the quiz
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
