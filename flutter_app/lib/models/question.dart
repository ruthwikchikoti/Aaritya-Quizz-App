class Question {
  final int id;
  final String question;
  final List<String> answers;
  final int correct;
  final String hint;
  final String explanation;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.hint,
    required this.explanation,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answers: List<String>.from(json['answers']),
      correct: json['correct'],
      hint: json['hint'],
      explanation: json['explanation'],
    );
  }
}