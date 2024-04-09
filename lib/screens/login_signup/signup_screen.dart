import 'package:ecots_frontend/components/login_signup/button_green.dart';

import 'package:ecots_frontend/constants/app_border.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              Text('Sign up', style: kLableTextBlackBig),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Let’s get you all st up so you can access your personal account.',
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
                    labelText: 'Full name',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
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
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    labelText: 'Phone number',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: borderRadiusTextField,
                    labelText: 'Day of birth',
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
                    labelText: 'Confirm password',
                    labelStyle: kLableTextBlackMinium,
                    focusedBorder: borderTextFieldFocus,
                    border: borderTextField),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
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
                  Expanded(
                    child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: AppColors.stack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            children: const [
                              TextSpan(text: 'I agree to all to '),
                              TextSpan(
                                  text: 'Term',
                                  style: TextStyle(color: AppColors.slamon)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policies',
                                  style: TextStyle(color: AppColors.slamon)),
                            ])),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ButtonGreen(
                title: 'Sign up',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
