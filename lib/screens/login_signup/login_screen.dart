import 'package:ecots_frontend/components/login_signup/button_green.dart';
import 'package:ecots_frontend/components/login_signup/button_icon.dart';
import 'package:ecots_frontend/constants/app_border.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/login_signup/forgot_password_screen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  bool _isChecked = false;
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
              Text('Login', style: kLableTextBlackBig),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Login to access your ecoTS account',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400)),
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
                height: 15,
              ),
              TextFormField(
                style: kLableTextBlackMinium,
                obscureText: _isObscured,
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    suffixIcon: IconButton(
                      icon: _isObscured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                    labelText: 'Password',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 154, 153, 153),
                      ),
                      Text(
                        'Remember me',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: AppColors.slamon,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const ButtonGreen(
                title: 'Login',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign up',
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
