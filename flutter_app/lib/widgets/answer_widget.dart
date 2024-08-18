import 'package:flutter/material.dart';
import '../models/question.dart';
import 'question_widget.dart';
import '../screens/result_screen.dart';

class AnswerWidget extends StatelessWidget {
  final List<Question> questions;
  final int currentQuestionIndex;
  final Function(bool) onAnswerResult;

  AnswerWidget({
    required this.questions,
    required this.currentQuestionIndex,
    required this.onAnswerResult,
  });

  void _handleAnswer(BuildContext context, int selectedAnswerIndex) {
    final correctAnswerIndex = questions[currentQuestionIndex].correct;
    final isCorrect = selectedAnswerIndex == correctAnswerIndex;

    onAnswerResult(isCorrect);

    if (currentQuestionIndex >= questions.length - 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: questions.where((q) => q.correct == selectedAnswerIndex).length,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return Center(child: Text("Quiz Completed!"));
    }

    return QuestionWidget(
      question: questions[currentQuestionIndex],
      onAnswerSelected: (selectedAnswerIndex) => _handleAnswer(context, selectedAnswerIndex),
    );
  }
}