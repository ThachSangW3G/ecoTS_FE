import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnswerCard extends StatefulWidget {
  final bool isCorrect;
  final bool isAnswered;
  final String order;
  final String answer;
  const AnswerCard(
      {super.key,
      required this.isCorrect,
      required this.isAnswered,
      required this.order,
      required this.answer});

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.isAnswered
            ? widget.isCorrect
                ? AppColors.anwserGreen
                : AppColors.anwserRed
            : AppColors.gray,
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
            child: Center(
              child: widget.isAnswered
                  ? widget.isCorrect
                      ? const Icon(
                          Icons.check,
                          color: AppColors.anwserGreen,
                        )
                      : const Icon(
                          Icons.close,
                          color: AppColors.anwserRed,
                        )
                  : Text(widget.order, style: kLableTextBlackW600),
            ),
          ),
          const Gap(10),
          Text(
            widget.answer,
            style:
                widget.isAnswered ? kLableTextWhiteW600 : kLableTextBlackW600,
          )
        ],
      ),
    );
  }
}
