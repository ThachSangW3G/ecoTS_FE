import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecots_frontend/components/donation/button_donation.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailDonate extends StatefulWidget {
  const DetailDonate({super.key});

  @override
  State<DetailDonate> createState() => _DetailDonateState();
}

class _DetailDonateState extends State<DetailDonate> {
  int? selectPoint;

  void _showSuccessDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, animation1, animation3) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return Center(
            child: AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Donation Success', style: kLableTextStyleSize26Green)
                ],
              ),
            ),
          );
        });
  }

  void _handleTextChanged(String value) {
    if (value.isEmpty) {
      try {
        int number = int.parse(value);

        setState(() {
          selectPoint = number;
        });
      } catch (e) {
        print('Lỗi chuyển đổi: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        title: Text(
          'Donation',
          style: kLableTextStyleLogoScreen,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                width: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/image3.png',
                        )),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Xây dựng trường cho trẻ em vùng cao',
                  maxLines: 2, style: kLableTextStyleSize26Green),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Bộ tộc Mixi Gaming',
                textAlign: TextAlign.start,
                style: kLableTextBlackW600Size16,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2000+ Donated',
                        style: kLableTextStyleTilteGreen,
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: 100,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: AppColors.shamrock,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2.0, color: AppColors.white)),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.shamrock,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2.0, color: AppColors.white)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total Donation',
                        style: kLableTextStyleTilteGreen,
                      ),
                      Text(
                        '2.000.000 POINTS',
                        style: kLableTextBlackW600,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 50;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 50
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '50\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 50
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 100;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 100
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '100\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 100
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectPoint = 500;
                      });
                    },
                    child: Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                              width: 2,
                              color: selectPoint == 500
                                  ? AppColors.green
                                  : AppColors.gray)),
                      child: Center(
                        child: Text(
                          '500\nPOINT',
                          textAlign: TextAlign.center,
                          style: selectPoint == 500
                              ? kLableTextStyleTilteGreen
                              : kLableTilteBlack,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
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
                      'Or',
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
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 235, 233, 233)),
                child: Center(
                  child: TextFormField(
                    onChanged: _handleTextChanged,
                    style: kLableTilteBlack,
                    cursorColor: AppColors.green,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter RuntahPoint Manually",
                        hintStyle: kLableTextStyle18Grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonDonation(
                title: 'Donante now',
                onClick: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      title: 'Donation success',
                      titleTextStyle: kLableTextStyleSize26Green,
                      desc: "Thank you for your donation",
                      descTextStyle: kLableTextStyleTilteGreen)
                    ..show();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo_mixi.png'))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'MixiGaming',
                    style: kLableTextBlackW600Size16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Dự án này là góp gạch xây trường này, 2018 ánnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn',
                style: kLableTextStyleMiniumGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
