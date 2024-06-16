import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:ecots_frontend/models/notifications/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class EarnPointCard extends StatelessWidget {
  final NotificationModel notification;
  const EarnPointCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray, width: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffEBFFD7)),
            child: Center(child: SvgPicture.asset('assets/icons/box.svg')),
          ),
          Gap(10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('Nhận điểm', style: kLableTextBlackW600Size16),
                Text('Đổi tại cơ sở: ${notification.exchangePointLocation}',
                    style: kLableTextItalic),
                Text('Số điểm: ${notification.points}',
                    style: kLableTextItalic),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat('yyyy-MM-dd').format(notification.createdAt),
                        style: kLableTextItalic),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
