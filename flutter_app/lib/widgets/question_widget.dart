import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final dynamic question;
  final Function(int?) onSubmit;
  final bool answerSubmitted;

  QuestionWidget({
    required this.question,
    required this.onSubmit,
    required this.answerSubmitted,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selectedAnswerIndex;
  bool showHint = false;
  bool showExplanation = false;

  @override
  void didUpdateWidget(covariant QuestionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      setState(() {
        selectedAnswerIndex = null;
        showHint = false;
        showExplanation = false;
      });
    }
  }

  void _showFeedbackDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct!' : 'Wrong!'),
          content: Text(isCorrect ? 'Great job!' : 'Better luck next time!'),
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          actions: [
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onSubmit(selectedAnswerIndex);
              },
            ),
          ],
        );
      },
    );
  }

  void _handleSubmit() {
    if (selectedAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an option')),
      );
      return;
    }

    bool isCorrect = selectedAnswerIndex == widget.question.correct;
    _showFeedbackDialog(isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.question.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...widget.question.answers.asMap().entries.map((entry) {
              int index = entry.key;
              String answer = entry.value;
              bool isSelected = selectedAnswerIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: widget.answerSubmitted
                      ? null
                      : () {
                          setState(() {
                            selectedAnswerIndex = index;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.white.withOpacity(0.3) : Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: widget.answerSubmitted ? null : _handleSubmit,
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text(showHint ? 'Hide Hint' : 'Show Hint', style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      showHint = !showHint;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            if (showHint)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Hint: ${widget.question.hint}',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.8)),
                ),
              ),
            if (widget.answerSubmitted)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: Text(showExplanation ? 'Hide Explanation' : 'Show Explanation', style: TextStyle(fontSize: 16, color: Colors.white)),
                  onPressed: () {
                    setState(() {
                      showExplanation = !showExplanation;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            if (showExplanation)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Explanation: ${widget.question.explanation}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
