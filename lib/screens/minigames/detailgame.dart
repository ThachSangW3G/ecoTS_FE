import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/quiz_question.dart';
import 'package:ecots_frontend/screens/minigames/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecots_frontend/screens/minigames/api_service.dart';

class DetailGame extends StatefulWidget {
  final int quizTopicId;

  const DetailGame({super.key, required this.quizTopicId});

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  late Future<List<QuizQuestion>> futureQuizQuestions;

  @override
  void initState() {
    super.initState();
    futureQuizQuestions = ApiService().fetchQuizQuestions(widget.quizTopicId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport game', style: kLableTextStyleTilte22Green),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: FutureBuilder<List<QuizQuestion>>(
          future: futureQuizQuestions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No questions found for this topic'));
            } else {
              List<QuizQuestion> questions = snapshot.data!;
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                          questions: questions,
                          currentQuestionIndex: 0,
                          correctAnswers: 0,
                          topicId: widget.quizTopicId,
                        ),
                      ),
                    );
                  },
                  child: Text('Start Quiz'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
