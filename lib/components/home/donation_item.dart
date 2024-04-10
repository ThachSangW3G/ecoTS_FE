import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/material.dart';

class DonationItem extends StatefulWidget {
  final String image;
  final String title;
  final String content;
  const DonationItem(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  @override
  State<DonationItem> createState() => _DonationItemState();
}

class _DonationItemState extends State<DonationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColors.concrete,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage(widget.image))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kLableTextBlackW600Size16,
              ),
              Text(widget.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kLableTextBlackW300Size14),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: const BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      'Donate',
                      style: kLableButtonDunation,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
