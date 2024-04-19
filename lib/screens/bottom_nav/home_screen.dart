import 'package:ecots_frontend/components/home/achivement.dart';
import 'package:ecots_frontend/components/home/donation_item.dart';
import 'package:ecots_frontend/components/home/material_item.dart';
import 'package:ecots_frontend/components/home/nearby_item.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/screens/donation/donation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, Le Dang Thuong',
                            style: kLableTextStyleTilteGreen),
                        Text('Welcome back !',
                            style: kLableTextStyleMiniumGrey),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset('assets/icons/bell.svg'),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 30,
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Achivement(title: 'SAVE O2', value: '5KG'),
                    Container(
                      height: 100,
                      width: 4,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Achivement(title: 'RECYCLED', value: '23'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Material', style: kLableTextBlackW600),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialItem(
                      icon: 'assets/icons/plus-circle.svg', title: 'Nhận điểm'),
                  MaterialItem(
                      icon: 'assets/icons/verified.svg', title: 'Tích điểm'),
                  MaterialItem(
                      icon: 'assets/icons/gamepad.svg', title: 'Học & chơi'),
                  MaterialItem(
                      icon: 'assets/icons/history.svg', title: 'Lịch sử'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Nearby bin station', style: kLableTextBlackW600),
                  Text(
                    'See all',
                    style: kLableTextGreyItalic,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const NearbyItem(
                  image: 'assets/images/image2.png',
                  address: 'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                  time: 'T2 - T6 9:00 - 17:00'),
              const SizedBox(
                height: 10,
              ),
              const NearbyItem(
                  image: 'assets/images/image2.png',
                  address: 'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                  time: 'T2 - T6 9:00 - 17:00'),
              const SizedBox(
                height: 10,
              ),
              const NearbyItem(
                  image: 'assets/images/image2.png',
                  address: 'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                  time: 'T2 - T6 9:00 - 17:00'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Donation', style: kLableTextBlackW600),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DonationScreen()));
                    },
                    child: Text(
                      'See all',
                      style: kLableTextGreyItalic,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const DonationItem(
                  image: 'assets/images/image1.png',
                  title: 'Use public transportation shi shi shi shi shi',
                  content:
                      'Leave your car behind and take a greener route, walking, biking or '),
              const SizedBox(
                height: 10,
              ),
              const DonationItem(
                  image: 'assets/images/image1.png',
                  title: 'Use public transportation shi shi shi shi shi',
                  content:
                      'Leave your car behind and take a greener route, walking, biking or '),
              const SizedBox(
                height: 10,
              ),
              const DonationItem(
                  image: 'assets/images/image1.png',
                  title: 'Use public transportation shi shi shi shi shi',
                  content:
                      'Leave your car behind and take a greener route, walking, biking or '),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
