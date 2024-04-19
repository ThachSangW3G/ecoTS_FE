import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/home/achivement.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.slamon),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.green),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/camera.svg',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Thạch Sang',
                  style: kLableTextBlackW600,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'thachsang2202@gmail.com',
                  style: kLableTextStyleMiniumGrey,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      color: AppColors.shamrock,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Achivement(title: 'POINTS', value: '7070'),
                      Container(
                        height: 100,
                        width: 4,
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      const Achivement(title: 'SAVE O2', value: '5KG'),
                      Container(
                        height: 100,
                        width: 4,
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      const Achivement(title: 'RECYCLED', value: '23'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
