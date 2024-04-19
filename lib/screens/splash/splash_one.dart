import 'package:ecots_frontend/components/splash/circle.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/splash/splash_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashOne extends StatefulWidget {
  const SplashOne({super.key});

  @override
  State<SplashOne> createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 590,
              width: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/splash1.png'))),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/bgplash.png'))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, left: 50, right: 50, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Circle(
                          size: 10,
                          color: AppColors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Circle(
                          size: 10,
                          color: AppColors.gray,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Circle(
                          size: 10,
                          color: AppColors.gray,
                        ),
                      ],
                    ),
                    Text('The world need to be change',
                        textAlign: TextAlign.center,
                        style: kLableTextStyleBigGreen),
                    Text(
                        'Menjual sampah, sampahmu pada tempat tertentu dan dapatkan hadiahe',
                        textAlign: TextAlign.center,
                        style: kLableTextStyleMediumGreen),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         child: const SplashTwo(),
                        //         type: PageTransitionType.rightToLeft));

                        Get.to(const SplashTwo(),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.green),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset('assets/icons/next.svg')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
