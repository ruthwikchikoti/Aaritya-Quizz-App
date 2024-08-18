import 'package:flutter/material.dart';
import 'dart:async';
import '../models/question.dart';
import '../widgets/question_widget.dart';
import '../utils/api_service.dart';
import '../widgets/progress_bar.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question>? _questions;
  int _score = 0;
  int _currentQuestionIndex = 0;
  bool _quizStarted = false;
  bool _isLoading = false;
  int _timeLeft = 30;
  Timer? _timer;
  bool _answerSubmitted = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startQuiz() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final questions = await ApiService().fetchQuestions();
      setState(() {
        _questions = questions;
        _quizStarted = true;
        _isLoading = false;
      });
      _startTimer();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load questions. Please try again.')),
      );
    }
  }

  void _startTimer() {
    _timeLeft = 30;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _moveToNextQuestion();
        }
      });
    });
  }

  void _moveToNextQuestion() {
    _timer?.cancel();
    setState(() {
      _answerSubmitted = false;
    });
    if (_currentQuestionIndex < _questions!.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
      _startTimer();
    } else {
      _endQuiz();
    }
  }

  void _handleAnswerSubmission(int? selectedAnswerIndex) {
    if (selectedAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an option')),
      );
      return;
    }
    bool correct = selectedAnswerIndex == _questions![_currentQuestionIndex].correct;
    if (correct) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _answerSubmitted = true;
    });
  }

  void _endQuiz() {
    _timer?.cancel();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: _score,
          totalQuestions: _questions!.length,
        ),
      ),
    );
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
          child: _quizStarted ? _buildQuizContent() : _buildStartButton(),
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
          : ElevatedButton(
              child: Text(
                'Start Quiz 🏁',  // Added emoji
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: _startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
    );
  }

  Widget _buildQuizContent() {
    if (_questions == null) {
      return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    }

    return Column(
      children: [
        ProgressBar(
          currentQuestion: _currentQuestionIndex + 1,
          totalQuestions: _questions!.length,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Score: $_score',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Time: $_timeLeft s',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: QuestionWidget(
            question: _questions![_currentQuestionIndex],
            onSubmit: _handleAnswerSubmission,
            answerSubmitted: _answerSubmitted,
          ),
        ),
        if (_answerSubmitted)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text(
                _currentQuestionIndex == _questions!.length - 1 ? 'Continue' : 'Next Question',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: _currentQuestionIndex == _questions!.length - 1 ? _endQuiz : _moveToNextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
