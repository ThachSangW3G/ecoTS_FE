import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGreen extends StatefulWidget {
  final String title;
  const ButtonGreen({super.key, required this.title});

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      decoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
        child: Text(
          widget.title,
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
