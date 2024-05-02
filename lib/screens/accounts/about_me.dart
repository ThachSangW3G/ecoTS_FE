import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        title: Text(
          'About me',
          style: kLableTextBlackW600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: kLableTilteBlack,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/person.svg',
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/mail.svg',
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/phone.svg',
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/phone.svg',
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width:
                            (MediaQuery.of(context).size.width - 40) / 2 - 10,
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/icons/phone.svg',
                                ),
                              )),
                        ),
                      ),
                      Container(
                        height: 50,
                        width:
                            (MediaQuery.of(context).size.width - 40) / 2 - 10,
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/icons/phone.svg',
                                ),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                  bottom: 140,
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: const BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        'Save settings',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
