import 'package:ecots_frontend/components/donation/donation_item_detail.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/donation_controller.dart';
import 'package:ecots_frontend/screens/donation/detail_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  DonationController donationController = Get.put(DonationController());

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  cursorColor: AppColors.green,
                  decoration: InputDecoration(
                      hintText: 'Search donation',
                      hintStyle: kLableTextStyleMiniumGrey,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset('assets/icons/search.svg'),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Obx(
                () => donationController.donationList.value != null &&
                        donationController.donationList.value!.isNotEmpty
                    ? SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              donationController.donationList.value!.length,
                          itemBuilder: (context, index) {
                            final donation =
                                donationController.donationList.value![index];
                            print(donation.coverImageUrl[0]);

                            return DonationItemDetail(
                              image: donation.coverImageUrl[0],
                              title: donation.title,
                              logo: 'assets/images/logo_mixi.png',
                              brand: 'Mixi Gaming',
                              onTap: () {
                                Get.to(() =>
                                    DetailDonate(donationId: donation.id));
                              },
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
              )

              // const DonationItemDetail(
              //     image: 'assets/images/image4.png',
              //     title: 'Xây trường vùng cao',
              //     logo: 'assets/images/logo_mixi.png',
              //     brand: 'Mixi Gaming'),
              // const SizedBox(
              //   height: 20,
              // ),
              // const DonationItemDetail(
              //     image: 'assets/images/image3.png',
              //     title: 'Tình nguyện hỗ trợ',
              //     logo: 'assets/images/logo_unicef.png',
              //     brand: 'Unicef'),
              // const SizedBox(
              //   height: 20,
              // ),
              // const DonationItemDetail(
              //     image: 'assets/images/image5.png',
              //     title: 'Nói không với rác thải',
              //     logo: 'assets/images/logo_saigonxanh.png',
              //     brand: 'SaigonXanh'),
              // const SizedBox(
              //   height: 20,
              // ),
              // const DonationItemDetail(
              //     image: 'assets/images/image5.png',
              //     title: 'Nói không với rác thải',
              //     logo: 'assets/images/logo_saigonxanh.png',
              //     brand: 'SaigonXanh'),
            ],
          ),
        ),
      ),
    );
  }
}
