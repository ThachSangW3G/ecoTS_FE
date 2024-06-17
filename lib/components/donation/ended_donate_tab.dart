import 'dart:async';

import 'package:ecots_frontend/components/donation/donation_item_detail.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/donation_controller.dart';
import 'package:ecots_frontend/screens/donation/detail_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EndedDonateTab extends StatefulWidget {
  const EndedDonateTab({super.key});

  @override
  State<EndedDonateTab> createState() => _EndedDonateTabState();
}

class _EndedDonateTabState extends State<EndedDonateTab> {
  DonationController donationController = Get.put(DonationController());

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      donationController.getEndedDonations();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startPolling();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            () => donationController.endedDonationList.value != null &&
                    donationController.endedDonationList.value!.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          donationController.endedDonationList.value!.length,
                      itemBuilder: (context, index) {
                        final donation =
                            donationController.endedDonationList.value![index];

                        return DonationItemDetail(
                          donation: donation,
                          onTap: () {
                            Get.to(() => DetailDonate(donationId: donation.id));
                          },
                        );
                      },
                    ),
                  )
                : const SizedBox(),
          ),
        )
      ],
    );
  }
}
