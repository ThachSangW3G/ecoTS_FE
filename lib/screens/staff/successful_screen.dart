import 'package:ecots_frontend/components/login_signup/button_green.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/screens/login_signup/login_screen.dart';
import 'package:ecots_frontend/screens/staff/home_screen_staff.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/successful.png'))),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Exchange trash successfully!',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.off(() => const HomeScreenStaff());
              },
              child: const ButtonGreen(
                title: 'Back to home',
              ),
            )
          ],
        ),
      ),
    );
  }
}
