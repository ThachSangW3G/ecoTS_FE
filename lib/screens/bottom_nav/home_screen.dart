import 'package:ecots_frontend/components/home/achivement.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';
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
                decoration: BoxDecoration(
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
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Achivement(title: 'SAVE O2', value: '5KG'),
                    Container(
                      height: 100,
                      width: 4,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Achivement(title: 'RECYCLED', value: '23'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
