import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EarnPointCard extends StatelessWidget {
  const EarnPointCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray, width: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffEBFFD7)),
          ),
          Gap(10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("EcoPoints", style: kLableTextBlackW600Size16),
                Text("EcoPoints", style: kLableTextGreyItalic),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("EcoPoints", style: kLableTextGreyItalic),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
