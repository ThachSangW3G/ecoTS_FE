import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/accounts/title_switch.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool allowNotify = false;
  bool emailNotify = true;
  bool orderNotify = false;
  bool generalNotify = true;

  void onChangedAllowNotify(bool value) {
    setState(() {
      allowNotify = !allowNotify;
    });
  }

  void onChangedEmailNotify(bool value) {
    setState(() {
      emailNotify = !emailNotify;
    });
  }

  void onChangedOrderNotify(bool value) {
    setState(() {
      orderNotify = !orderNotify;
    });
  }

  void onChangedGeneralNotify(bool value) {
    setState(() {
      generalNotify = !generalNotify;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whisper,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: kLableTextBlackW600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TitleSwitch(
                title: 'Allow Notifcations',
                content:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',
                value: allowNotify,
                onChanged: onChangedAllowNotify,
              ),
              TitleSwitch(
                title: 'Email Notifcations',
                content:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',
                value: emailNotify,
                onChanged: onChangedEmailNotify,
              ),
              TitleSwitch(
                title: 'Order Notifcations',
                content:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',
                value: orderNotify,
                onChanged: onChangedOrderNotify,
              ),
              TitleSwitch(
                title: 'General Notifcations',
                content:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumym',
                value: generalNotify,
                onChanged: onChangedGeneralNotify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
