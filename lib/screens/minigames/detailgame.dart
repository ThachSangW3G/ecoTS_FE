import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:flutter/material.dart';

class DetailGame extends StatelessWidget {
  final QuizTopic quizTopic;

  const DetailGame({super.key, required this.quizTopic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizTopic.topicName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quizTopic.description,
              style: TextStyle(fontSize: 18),
            ),
            // Hiển thị các thông tin khác của quizTopic ở đây
          ],
        ),
      ),
    );
  }
}
