import 'dart:io';

import 'package:ecots_frontend/components/donation/button_donation.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/waste_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ecots_frontend/models/wastes/waste.dart';

class ValidatingScreen extends StatefulWidget {
  final File file;
  final String waste;
  const ValidatingScreen({super.key, required this.file, required this.waste});

  @override
  State<ValidatingScreen> createState() => _ValidatingScreenState();
}

class _ValidatingScreenState extends State<ValidatingScreen> {
  WasteController wasteController = Get.put(WasteController());

  Waste? waste;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waste = wasteController.materialList.value!
        .firstWhere((element) => element.name == widget.waste);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Validating',
          style: kLableTextStyleLogoScreen,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        fit: BoxFit.cover,
                        height: 500,
                        width: 350,
                        opacity: const AlwaysStoppedAnimation(07),
                        image: FileImage(File(widget.file.path))),
                  ),
                ),
              ],
            ),
            Gap(20),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.concrete,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Material', style: kLableTilteBlack),
                      Gap(10),
                      Text(waste != null ? waste!.name : widget.waste,
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Points', style: kLableTilteBlack),
                      Gap(10),
                      Text(
                          waste != null
                              ? waste!.pointsPerKg.toString()
                              : 'none',
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Save CO2', style: kLableTilteBlack),
                      Gap(10),
                      Text(
                          waste != null
                              ? waste!.co2SavedPerKg.toString()
                              : 'none',
                          style: kLableTextStyleMiniumGrey),
                    ],
                  ),
                ],
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonDonation(
                  title: 'Continue',
                  onClick: () {
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
