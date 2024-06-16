import 'package:ecots_frontend/components/achivements/achivement_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/achivement_controller.dart';
import 'package:ecots_frontend/controllers/achivemetn_level_controller.dart';
import 'package:ecots_frontend/controllers/user_controller.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AchivementScreen extends StatefulWidget {
  const AchivementScreen({super.key});

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {
  AchivementController achivementController = Get.put(AchivementController());
  AchivementLevelController achivementLevelController =
      Get.put(AchivementLevelController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Archivement',
            style: kLableTextStyleTilteGreen,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Gap(20),
                ListView.builder(
                    itemCount:
                        achivementController.achivementList.value!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final achivement =
                          achivementController.achivementList.value![index];

                      return Container(
                        width: MediaQuery.of(context).size.width - 20,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.gray, width: 0.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              achivement.type == "COUNT_DONATE"
                                  ? "Number of donations"
                                  : achivement.type == "TOTAL_POINTS_DONATE"
                                      ? "Total donation points"
                                      : achivement.type == "USER_MAX_POINT"
                                          ? "Highest points"
                                          : achivement.type == "SAVE_CO2"
                                              ? "Save CO2"
                                              : "Number of use camera detect",
                              style: kLableTextBlackW600,
                            ),
                            FutureBuilder(
                                future: achivementLevelController
                                    .getAchimentLevelByAchivementId(achivement),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final achivementLevelList = snapshot.data;

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: achivementLevelList!.length,
                                      itemBuilder: (context, index) {
                                        final achivementLevel =
                                            achivementLevelList[index];

                                        final achivementResult =
                                            achivementLevelController
                                                .achivementResultList.value!
                                                .firstWhere((element) =>
                                                    element
                                                        .achievementLevelId ==
                                                    achivementLevel.id);
                                        return AchivementCard(
                                          title: achivementLevel.name,
                                          image: achivementResult.iconUrl,
                                          maxValue: achivementResult.maxIndex
                                              .toDouble(),
                                          currentValue:
                                              achivementResult.currentIndex,
                                          isCompleted:
                                              achivementResult.progress >=
                                                  100.0,
                                        );
                                      },
                                    );
                                  } else {
                                    return Text('Không có dữ liệu');
                                  }
                                })
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
