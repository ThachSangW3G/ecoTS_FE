import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadLogo extends StatefulWidget {
  const LoadLogo({super.key});

  @override
  State<LoadLogo> createState() => _LoadLogoState();
}

class _LoadLogoState extends State<LoadLogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
            Text('EcoTS',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0)))
          ],
        ),
      ),
    );
  }
}
