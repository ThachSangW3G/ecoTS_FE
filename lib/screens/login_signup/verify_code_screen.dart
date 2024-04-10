import 'package:ecots_frontend/components/login_signup/button_green.dart';

import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/login_signup/set_password_screen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.length == 1 && i < controllers.length - 1) {
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        }
      });
    }
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Verify code', style: kLableTextBlackBig),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'An authentication code has been sent to your email (Code with 6 digits).',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 50.0,
                            child: TextField(
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: kLableTextBlackMinium,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                counter: SizedBox.shrink(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index < controllers.length - 1) {
                                    FocusScope.of(context)
                                        .requestFocus(focusNodes[index + 1]);
                                  } else {
                                    // Chúng ta có thể thực hiện hành động khác khi nhập xong tất cả các TextField
                                  }
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Didn’t receive a code?',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Resend',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: AppColors.slamon,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SetPasswordScreen()));
                        },
                        child: const ButtonGreen(
                          title: 'Verify',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]))));
  }
}
