import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonationItemDetail extends StatefulWidget {
  final String image;
  final String title;
  final String logo;
  final String brand;
  final Function()? onTap;
  const DonationItemDetail(
      {super.key,
      required this.image,
      required this.title,
      required this.logo,
      required this.brand,
      this.onTap});

  @override
  State<DonationItemDetail> createState() => _DonationItemDetailState();
}

class _DonationItemDetailState extends State<DonationItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.image))),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.title,
              style: kLableTextBlackW600,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(widget.logo))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.brand,
                    style: kLableTextBlackW600Size16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: const BoxDecoration(
                                color: AppColors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              'Donate',
                              style: kLableButtonDunation,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
