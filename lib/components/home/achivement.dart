import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';

class Achivement extends StatefulWidget {
  final String title;
  final String value;
  const Achivement({super.key, required this.title, required this.value});

  @override
  State<Achivement> createState() => _AchivementState();
}

class _AchivementState extends State<Achivement> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
            ),
          ),
          Text(widget.value, style: kLableBoldWhite),
          Text(widget.title, style: kLableW800White),
        ],
      ),
    );
  }
}
