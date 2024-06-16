import 'dart:math';
import 'package:ecots_frontend/components/minigames/answer_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/quiz_question.dart';
import 'package:ecots_frontend/screens/minigames/resultgame.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuestionScreen extends StatefulWidget {
  final List<QuizQuestion> questions;
  final int currentQuestionIndex;
  final int correctAnswers;
  final int topicId;

  const QuestionScreen({
    super.key,
    required this.questions,
    required this.currentQuestionIndex,
    required this.correctAnswers,
    required this.topicId,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedAnswer;
  bool isAnswered = false;
  bool hasCheckedAnswer = false;
  late List<Map<String, dynamic>> answers;

  @override
  void initState() {
    super.initState();
    _randomizeAnswers();
  }

  void _randomizeAnswers() {
    final question = widget.questions[widget.currentQuestionIndex];
    answers = [
      {'answer': question.correctAnswer, 'isCorrect': true},
      {'answer': question.incorrectAnswer1, 'isCorrect': false},
      {'answer': question.incorrectAnswer2, 'isCorrect': false},
    ];
    answers.shuffle(Random());
  }

  void _selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void _checkAnswer() {
    setState(() {
      isAnswered = true;
      hasCheckedAnswer = true;
    });
  }

  void _nextQuestion() {
    int newCorrectAnswers = widget.correctAnswers;
    if (selectedAnswer == answers.firstWhere((a) => a['isCorrect'])['answer']) {
      newCorrectAnswers++;
    }

    if (widget.currentQuestionIndex < widget.questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            questions: widget.questions,
            currentQuestionIndex: widget.currentQuestionIndex + 1,
            correctAnswers: newCorrectAnswers,
            topicId: widget.topicId,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultGame(
            correctAnswers: newCorrectAnswers,
            totalQuestions: widget.questions.length,
            topicId: widget.topicId,
          ),
        ),
      );
    }
  }

  void _doNothing() {
    // Dummy function to do nothing
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[widget.currentQuestionIndex];
    final totalQuestions = widget.questions.length;
    final progress = (widget.currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sport game', style: kLableTextStyleTilte22Green),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.backgroundProgress,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
            ),
            const Gap(10),
            Text(
              'Question ${widget.currentQuestionIndex + 1} of $totalQuestions',
              style: kLableTextStyle18Grey,
            ),
            const Gap(20),
            Text(
              question.questionText,
              style: kQuestionTextStyle,
            ),
            const Gap(20),
            ...answers.map((answer) => AnswerCard(
                  isCorrect: answer['isCorrect'] && isAnswered,
                  isSelected: selectedAnswer == answer['answer'],
                  order:
                      'A', // You might want to update the order dynamically if needed
                  answer: answer['answer'],
                  onTap: !hasCheckedAnswer
                      ? () => _selectAnswer(answer['answer'])
                      : _doNothing,
                )),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: hasCheckedAnswer ? _nextQuestion : _checkAnswer,
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      hasCheckedAnswer ? 'Next' : 'Check Answer',
                      style: kLableBoldWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
