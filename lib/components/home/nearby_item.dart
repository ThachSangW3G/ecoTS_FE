import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/constants/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NearbyItem extends StatefulWidget {
  final String image;
  final String address;
  final String time;
  const NearbyItem(
      {super.key,
      required this.image,
      required this.address,
      required this.time});

  @override
  State<NearbyItem> createState() => _NearbyItemState();
}

class _NearbyItemState extends State<NearbyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 5),
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.address,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: kLableTextBlackW600Size16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('${widget.time}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kLableTextBlackW300Size14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Chỉ đường',
                    style: kLableChiDuong,
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
