import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaterialItem extends StatelessWidget {
  final String icon;
  final String title;
  const MaterialItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: kLableTextBlackSize16,
        )
      ],
    );
  }
}
