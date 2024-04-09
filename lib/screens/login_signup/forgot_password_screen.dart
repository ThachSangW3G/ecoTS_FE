import 'package:ecots_frontend/components/login_signup/button_green.dart';
import 'package:ecots_frontend/components/login_signup/button_icon.dart';
import 'package:ecots_frontend/constants/app_border.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/login_signup/verify_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
                      Text('Forgot your password?', style: kLableTextBlackBig),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Don’t worry, happens to all of us. Enter your email below to recover your password.',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: borderRadiusTextField,
                            labelText: 'Email',
                            labelStyle: kLableTextBlackMinium,
                            focusedBorder: borderTextFieldFocus,
                            border: borderTextField),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerifyCodeScreen()));
                        },
                        child: const ButtonGreen(
                          title: 'Submit',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              height: 1.0,
                              indent: 2.0,
                              color: AppColors.stack,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or login with',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: AppColors.stack, fontSize: 16)),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              height: 1.0,
                              color: AppColors.stack,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonIcon(icon: 'assets/icons/facebook_icon.svg'),
                          ButtonIcon(icon: 'assets/icons/google_icon.svg'),
                          ButtonIcon(icon: 'assets/icons/apple_icon.svg')
                        ],
                      )
                    ]))));
  }
}
