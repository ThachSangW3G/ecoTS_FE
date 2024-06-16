import 'dart:convert';
import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:ecots_frontend/screens/minigames/user_progress.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.2.10:7050/api/quiz-topics';

  Future<List<QuizTopic>> fetchQuizTopics() async {
    final response = await http.get(Uri.parse('$baseUrl/quiz-topics/get-all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((topic) => QuizTopic.fromJson(topic)).toList();
    } else {
      throw Exception('Failed to load quiz topics');
    }
  }

  Future<UserProgress> fetchUserProgress(int userId, int topicId) async {
    final response = await http
        .get(Uri.parse('$baseUrl/user-progress/user/$userId/topic/$topicId'));

    if (response.statusCode == 200) {
      return UserProgress.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user progress');
    }
  }
}
