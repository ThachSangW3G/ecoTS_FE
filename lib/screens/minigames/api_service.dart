import 'dart:convert';
import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:7050/api/quiz-topics';

  Future<List<QuizTopic>> fetchQuizTopics() async {
    final response = await http.get(Uri.parse('$baseUrl/get-all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((topic) => QuizTopic.fromJson(topic)).toList();
    } else {
      throw Exception('Failed to load quiz topics');
    }
  }
}
