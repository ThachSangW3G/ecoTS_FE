import 'dart:async';

import 'package:ecots_frontend/components/get_points/earn_point_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/controllers/notification_controller.dart';
import 'package:ecots_frontend/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EarnPointsTab extends StatefulWidget {
  const EarnPointsTab({super.key});

  @override
  State<EarnPointsTab> createState() => _EarnPointsState();
}

class _EarnPointsState extends State<EarnPointsTab> {
  NotificationController notificationController =
      Get.put(NotificationController());
  UserController userController = Get.put(UserController());

  late Timer _timer;

  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      notificationController
          .getAllNotification(userController.currentUser.value!.id);
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
    return Container(
        child: Column(
      children: [
        Obx(() => notificationController.notificationList.value != null &&
                notificationController.notificationList.value!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    notificationController.notificationList.value!.length,
                itemBuilder: (context, index) {
                  final notification =
                      notificationController.notificationList.value![index];
                  return EarnPointCard(notification: notification);
                },
              )
            : const SizedBox())
      ],
    ));
  }
}
