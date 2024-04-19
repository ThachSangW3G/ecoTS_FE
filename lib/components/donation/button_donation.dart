import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';

class ButtonDonation extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  const ButtonDonation({super.key, required this.title, required this.onClick});

  @override
  State<ButtonDonation> createState() => _ButtonDonationState();
}

class _ButtonDonationState extends State<ButtonDonation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Text(
            widget.title,
            style: kLableBoldWhite,
          ),
        ),
      ),
    );
  }
}
