import 'package:ecots_frontend/components/donation/donation_item_detail.dart';
import 'package:ecots_frontend/components/donation/ended_donate_tab.dart';
import 'package:ecots_frontend/components/donation/ongoing_donate_tab.dart';
import 'package:ecots_frontend/components/donation/upcoming_donate_tab.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/donation_controller.dart';
import 'package:ecots_frontend/screens/donation/detail_donate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen>
    with SingleTickerProviderStateMixin {
  DonationController donationController = Get.put(DonationController());

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Text(
          'Donation',
          style: kLableTextStyleLogoScreenWhite,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.green,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Upcoming',
                    style: kLableTextStyle18White,
                  ),
                ),
                Tab(
                  child: Text(
                    'Ongoing',
                    style: kLableTextStyle18White,
                  ),
                ),
                Tab(
                  child: Text(
                    'Ended',
                    style: kLableTextStyle18White,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                UpcomingDonateTab(),
                OngoingDonateTab(),
                EndedDonateTab()
              ],
            ),
          ),

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
    );
  }
}
