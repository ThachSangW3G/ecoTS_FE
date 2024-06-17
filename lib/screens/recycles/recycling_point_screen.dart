import 'package:ecots_frontend/components/home/nearby_item.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/location_controller.dart';
import 'package:ecots_frontend/screens/maps/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class RecyclingPointScreen extends StatefulWidget {
  const RecyclingPointScreen({super.key});

  @override
  State<RecyclingPointScreen> createState() => _RecyclingPointScreenState();
}

class _RecyclingPointScreenState extends State<RecyclingPointScreen> {
  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recycling Point',
          style: kLableTextStyleTilte22Green,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              const Gap(10),
              Obx(() => locationController.locationList.value != null &&
                      locationController.locationList.value!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: locationController.locationList.value!.length,
                      itemBuilder: (context, index) {
                        final location =
                            locationController.locationList.value![index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => MapScreen(
                                  choosePoint: LatLng(
                                      location.latitude, location.longitude),
                                ));
                          },
                          child: NearbyItem(
                            location: location,
                          ),
                        );
                      },
                    )
                  : const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
