import 'dart:convert';
import 'package:ecots_frontend/models/user.dart';
import 'package:ecots_frontend/screens/minigames/quiz_question.dart';
import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:ecots_frontend/screens/minigames/user_progress.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.2.10:7050';

  Future<List<QuizTopic>> fetchQuizTopics() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/quiz-topics/get-all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((topic) => QuizTopic.fromJson(topic)).toList();
    } else {
      print('Failed to load quiz topics: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load quiz topics');
    }
  }

  Stream<UserProgress> fetchUserProgressStream(int userId, int topicId) async* {
    while (true) {
      final response = await http.get(
          Uri.parse('$baseUrl/api/user-progress/user/$userId/topic/$topicId'));

      if (response.statusCode == 200) {
        yield UserProgress.fromJson(json.decode(response.body));
      } else {
        print('Failed to load user progress: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load user progress');
      }

      await Future.delayed(
          Duration(seconds: 5)); // Thời gian chờ giữa các lần fetch
    }
  }

  Future<List<QuizQuestion>> fetchQuizQuestions(int topicId) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/quiz-questions/get-all-question-by-topic?id=$topicId'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => QuizQuestion.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load quiz questions');
    }
  }

  Future<int> getUserIdFromToken(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/token?token=$token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['id'];
    } else {
      throw Exception('Failed to fetch user ID');
    }
  }

  Future<void> completeQuizAddPoints(int userId, double points) async {
    final response = await http.put(
      Uri.parse(
          '$baseUrl/point/complete-quiz-add-points?userId=$userId&points=$points'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update points');
    }
  }

  Future<void> updateUserProgress(
      int userId, int topicId, double progress) async {
    final response = await http.put(
      Uri.parse(
          '$baseUrl/api/user-progress/user/$userId/topic/$topicId?progress=$progress'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update progress');
    }
  }
}
