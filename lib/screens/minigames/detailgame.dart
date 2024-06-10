import 'package:ecots_frontend/components/donation/button_donation.dart';
import 'package:ecots_frontend/components/minigames/answer_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/resultgame.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DetailGame extends StatefulWidget {
  const DetailGame({super.key});

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport game', style: kLableTextStyleTilte22Green),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                      final double maxWidth = constraints.maxWidth;
                      final double progressWidth = maxWidth * 0.5;
                      return Stack(
                        children: [
                          Container(
                            height: 15,
                            width: maxWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.backgroundProgress),
                          ),
                          Container(
                            height: 15,
                            width: progressWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.progress1,
                                    AppColors.progress2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                color: AppColors.backgroundProgress),
                          ),
                        ],
                      );
                    })),
                    Gap(10),
                    Text('1/5', style: kLableTextStyle18Grey),
                  ],
                ),
                Gap(50),
                Text(
                    'PREDICT THE TOP LOSER (for tomorrow) across these indices',
                    style: kQuestionTextStyle),
                const Gap(50),
                AnswerCard(
                    isCorrect: true,
                    isAnswered: true,
                    order: 'A',
                    answer: 'Answer one...'),
                AnswerCard(
                    isCorrect: false,
                    isAnswered: true,
                    order: 'A',
                    answer: 'Answer one...'),
                AnswerCard(
                    isCorrect: true,
                    isAnswered: false,
                    order: 'A',
                    answer: 'Answer one...')
              ],
            ),
            Positioned(
              bottom: 10,
              child: InkWell(
                onTap: () {
                  Get.to(() => ResultGame());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: const BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: kLableBoldWhite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
