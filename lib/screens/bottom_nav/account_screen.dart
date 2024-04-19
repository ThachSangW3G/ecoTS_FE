import 'package:ecots_frontend/components/home/tile.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/accounts/about_me.dart';
import 'package:ecots_frontend/screens/accounts/notification_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
      backgroundColor: AppColors.whisper,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.slamon),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Thạch Sang',
                  style: kLableTextBlackW600,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'thachsang2202@gmail.com',
                  style: kLableTextStyleMiniumGrey,
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const AboutMe());
                  },
                  child: const Tile(
                      icon: 'assets/icons/aboutme.svg',
                      haveArrowRight: true,
                      title: 'About me'),
                ),
                const Tile(
                    icon: 'assets/icons/myhistory.svg',
                    haveArrowRight: true,
                    title: 'My history'),
                InkWell(
                  onTap: () {
                    Get.to(const NotificationSetting());
                  },
                  child: const Tile(
                      icon: 'assets/icons/notification.svg',
                      haveArrowRight: true,
                      title: 'Notifications'),
                ),
                const Tile(
                    icon: 'assets/icons/notification.svg',
                    haveArrowRight: true,
                    title: 'Change password'),
                const Tile(
                    icon: 'assets/icons/notification.svg',
                    haveArrowRight: true,
                    title: 'Policy'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Other',
                      style: kLableTextStyle18Grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Tile(
                    icon: 'assets/icons/version.svg',
                    haveArrowRight: false,
                    title: 'Version',
                    rightContent: '1.1.0'),
                InkWell(
                  onTap: () {},
                  child: const Tile(
                    icon: 'assets/icons/signout.svg',
                    haveArrowRight: false,
                    title: 'Sign out',
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
