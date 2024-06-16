import 'package:ecots_frontend/components/get_points/earn_point_card.dart';
import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EarnPointsTab extends StatefulWidget {
  const EarnPointsTab({super.key});

  @override
  State<EarnPointsTab> createState() => _EarnPointsState();
}

class _EarnPointsState extends State<EarnPointsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [EarnPointCard(), EarnPointCard(), EarnPointCard()],
    ));
  }
}
