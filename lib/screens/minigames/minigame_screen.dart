import 'package:ecots_frontend/components/minigames/quizcard.dart';
import 'package:ecots_frontend/components/minigames/quizhorizoncard.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/detailgame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MiniGameScreen extends StatefulWidget {
  const MiniGameScreen({super.key});

  @override
  State<MiniGameScreen> createState() => _MiniGameScreenState();
}

class _MiniGameScreenState extends State<MiniGameScreen> {
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
                SizedBox(
                  height: 320,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      QuizCard(),
                      QuizCard(),
                      QuizCard(),
                    ],
                  ),
                ),
                const Gap(10),
                Text(
                  'Unfinished Games',
                  style: kLableTextStyleTilteGreen,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    QuizHorizonCard(
                      onTap: () {
                        Get.to(() => DetailGame());
                      },
                    ),
                    QuizHorizonCard(
                      onTap: () {
                        Get.to(() => DetailGame());
                      },
                    ),
                    QuizHorizonCard(
                      onTap: () {
                        Get.to(() => DetailGame());
                      },
                    ),
                    QuizHorizonCard(
                      onTap: () {
                        Get.to(() => DetailGame());
                      },
                    ),
                    QuizHorizonCard(
                      onTap: () {
                        Get.to(() => DetailGame());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
