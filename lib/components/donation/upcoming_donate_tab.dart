import 'package:ecots_frontend/components/donation/donation_item_detail.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/donation_controller.dart';
import 'package:ecots_frontend/screens/donation/detail_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UpcomingDonateTab extends StatefulWidget {
  const UpcomingDonateTab({super.key});

  @override
  State<UpcomingDonateTab> createState() => _UpcomingDonateTabState();
}

class _UpcomingDonateTabState extends State<UpcomingDonateTab> {
  DonationController donationController = Get.put(DonationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
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
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => donationController.donationList.value != null &&
                      donationController.donationList.value!.isNotEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            donationController.donationList.value!.length,
                        itemBuilder: (context, index) {
                          final donation =
                              donationController.donationList.value![index];
                          print(donation.coverImageUrl[0]);

                          return DonationItemDetail(
                            donation: donation,
                            onTap: () {
                              Get.to(
                                  () => DetailDonate(donationId: donation.id));
                            },
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
