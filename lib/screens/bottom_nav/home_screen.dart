import 'package:ecots_frontend/components/home/achivement.dart';
import 'package:ecots_frontend/components/home/donation_item.dart';
import 'package:ecots_frontend/components/home/material_item.dart';
import 'package:ecots_frontend/components/home/nearby_item.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/donation_controller.dart';
import 'package:ecots_frontend/controllers/location_controller.dart';
import 'package:ecots_frontend/controllers/point_controller.dart';
import 'package:ecots_frontend/controllers/user_controller.dart';
import 'package:ecots_frontend/screens/donation/detail_donate.dart';
import 'package:ecots_frontend/screens/donation/donation_screen.dart';
import 'package:ecots_frontend/screens/get_points/scanbarcode_srceen.dart';
import 'package:ecots_frontend/screens/maps/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserController userController = Get.put(UserController());
  DonationController donationController = Get.put(DonationController());
  PointController pointController = Get.put(PointController());
  LocationController locationController = Get.put(LocationController());

  String fullName = '';

  @override
  void initState() {
    super.initState();
    _loadFullName();
  }

  _loadFullName() async {
    final prefs = await _prefs;
    setState(() {
      fullName = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: userController
                                          .currentUser.value!.avatarUrl !=
                                      null
                                  ? NetworkImage(userController
                                      .currentUser.value!.avatarUrl!)
                                  : const AssetImage(
                                          'assets/images/default_avatar.jpg')
                                      as ImageProvider,
                              fit: BoxFit.cover),
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(width: 1, color: AppColors.gray)),

                      // child: ClipOval(
                      //   child: Image.network(
                      //     userController.currentUser.value!.avatarUrl!,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Hi, ${userController.currentUser.value!.fullName}',
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
                        InkWell(
                            onTap: () async {
                              // final token =
                              //     (await _prefs).getString('tokenAccess');
                              // print(token);

                              //await donationController.getAllDonations();

                              await pointController.getPointByToken();
                            },
                            child: SvgPicture.asset('assets/icons/bell.svg')),
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
                    child: Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Achivement(
                              image: 'assets/images/giftbox.png',
                              title: 'POINTS',
                              value: pointController.currentPoint.value!.point
                                  .toString()),
                          Container(
                            height: 100,
                            width: 4,
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          Achivement(
                              image: 'assets/images/O2.png',
                              title: 'SAVE O2',
                              value:
                                  '${pointController.currentPoint.value!.saveCo2}KG'),
                          Container(
                            height: 100,
                            width: 4,
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          const Achivement(
                              image: 'assets/images/recycle.png',
                              title: 'RECYCLED',
                              value: '23'),
                        ],
                      ),
                    )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const ScanBarcodeScreen());
                      },
                      child: const MaterialItem(
                          icon: 'assets/icons/plus-circle.svg',
                          title: 'Nhận điểm'),
                    ),
                    const MaterialItem(
                        icon: 'assets/icons/verified.svg', title: 'Tích điểm'),
                    const MaterialItem(
                        icon: 'assets/icons/gamepad.svg', title: 'Học & chơi'),
                    const MaterialItem(
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
                    InkWell(
                      onTap: () {
                        Get.to(() => const MapScreen());
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
                // const NearbyItem(
                //     image: 'assets/images/image2.png',
                //     address:
                //         'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                //     time: 'T2 - T6 9:00 - 17:00'),
                // const SizedBox(
                //   height: 10,
                // ),
                // const NearbyItem(
                //     image: 'assets/images/image2.png',
                //     address:
                //         'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                //     time: 'T2 - T6 9:00 - 17:00'),
                // const SizedBox(
                //   height: 10,
                // ),
                // const NearbyItem(
                //     image: 'assets/images/image2.png',
                //     address:
                //         'Trường THCS Bạch Đằng, Long Sơn, Bà Rịa - Vũng Tàu',
                //     time: 'T2 - T6 9:00 - 17:00'),

                Obx(() => locationController.locationList.value != null &&
                        locationController.locationList.value!.isNotEmpty
                    ? SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              locationController.locationList.value!.length,
                          itemBuilder: (context, index) {
                            final location =
                                locationController.locationList.value![index];
                            return InkWell(
                              onTap: () {
                                Get.to(() => MapScreen(
                                      choosePoint: LatLng(location.latitude,
                                          location.longitude),
                                    ));
                              },
                              child: NearbyItem(
                                  image: 'assets/images/image2.png',
                                  address: location.locationName,
                                  time: location.description),
                            );
                          },
                        ),
                      )
                    : const SizedBox()),

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DonationScreen()));
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

                              return DonationItem(
                                image: donation.coverImageUrl.first,
                                title: donation.title,
                                content: donation.description,
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

                // const DonationItem(
                //     image: 'assets/images/image1.png',
                //     title: 'Use public transportation shi shi shi shi shi',
                //     content:
                //         'Leave your car behind and take a greener route, walking, biking or '),
                // const SizedBox(
                //   height: 10,
                // ),
                // const DonationItem(
                //     image: 'assets/images/image1.png',
                //     title: 'Use public transportation shi shi shi shi shi',
                //     content:
                //         'Leave your car behind and take a greener route, walking, biking or '),
                // const SizedBox(
                //   height: 10,
                // ),
                // const DonationItem(
                //     image: 'assets/images/image1.png',
                //     title: 'Use public transportation shi shi shi shi shi',
                //     content:
                //         'Leave your car behind and take a greener route, walking, biking or '),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
