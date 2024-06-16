import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/minigames/quiz_topic.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizHorizonCard extends StatelessWidget {
  final QuizTopic quizTopic;
  final VoidCallback onTap;

  const QuizHorizonCard(
      {super.key, required this.quizTopic, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.gray, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(quizTopic.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quizTopic.topicName,
                    style: kLableTextBlackW600,
                  ),
                  Text(
                    '${quizTopic.numberQuestion} questions',
                    style: kLableTextStyleMiniumGrey,
                  ),
                ],
              ),
            ),
            const Gap(10),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              percent: 0.6, // Giá trị phần trăm (60%)
              center: Text(
                "60%",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              progressColor: AppColors.green,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
