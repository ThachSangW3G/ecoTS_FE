import 'package:ecots_frontend/components/minigames/answer_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ResultGame extends StatefulWidget {
  const ResultGame({super.key});

  @override
  State<ResultGame> createState() => _ResultGameState();
}

class _ResultGameState extends State<ResultGame> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/result.png')),
                  ),
                ),
                Text('Result of the game', style: kQuestionTextStyle),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(Icons.money, color: AppColors.green),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Text(
                          'Score gained',
                          style: kLableTextBlackW600,
                        ),
                      ),
                      Text(
                        '100',
                        style: kLableTextBlackW600,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(Icons.check, color: AppColors.green),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Text(
                          'Correct predictions',
                          style: kLableTextBlackW600,
                        ),
                      ),
                      Text(
                        '5',
                        style: kLableTextBlackW600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Text(
                    'Okay',
                    style: kLableBoldWhite,
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
