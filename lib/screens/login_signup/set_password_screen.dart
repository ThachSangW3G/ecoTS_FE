import 'package:ecots_frontend/components/login_signup/button_green.dart';
import 'package:ecots_frontend/constants/app_border.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/login_signup/successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  bool _isObscured = true;
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
                      Text('Set a password', style: kLableTextBlackBig),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Your previous password has been reseted. Please set a new password for your account.',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
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
                            labelText: 'Create password',
                            labelStyle: kLableTextBlackMinium,
                            focusedBorder: borderTextFieldFocus,
                            border: borderTextField),
                      ),
                      const SizedBox(
                        height: 20,
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
                            labelText: 'Re-enter password',
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
                                      const SuccessfulScreen()));
                        },
                        child: const ButtonGreen(
                          title: 'Set new password',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]))));
  }
}
