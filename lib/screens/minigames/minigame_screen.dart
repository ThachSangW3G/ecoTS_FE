import 'package:ecots_frontend/components/minigames/quizhorizoncard.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/detailgame.dart';
import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ecots_frontend/screens/minigames/api_service.dart'; // Import chính xác

class MiniGameScreen extends StatefulWidget {
  const MiniGameScreen({super.key});

  @override
  State<MiniGameScreen> createState() => _MiniGameScreenState();
}

class _MiniGameScreenState extends State<MiniGameScreen> {
  late Future<List<QuizTopic>> futureQuizTopics;

  @override
  void initState() {
    super.initState();
    futureQuizTopics = ApiService().fetchQuizTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Game', style: kLableTextStyleTilte22Green),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What would you like to play today?',
                  style: kLableTextStyleTilteGreen),
              const Gap(10),
              Text(
                'Available Games',
                style: kLableTextStyleTilteGreen,
              ),
              FutureBuilder<List<QuizTopic>>(
                future: futureQuizTopics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No quiz topics found'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final quizTopic = snapshot.data![index];
                        return QuizHorizonCard(
                          quizTopic: quizTopic,
                          onTap: () {
                            Get.to(() => DetailGame(quizTopic: quizTopic));
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
