import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8000/';

  Future<List<Question>> fetchQuestions() async {
    try {
      print('Attempting to fetch questions from: $baseUrl/questions');
      final response = await http.get(Uri.parse('$baseUrl/questions'));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Question.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching questions: $e');
      throw Exception('Failed to load questions. Error: $e');
    }
  }
}