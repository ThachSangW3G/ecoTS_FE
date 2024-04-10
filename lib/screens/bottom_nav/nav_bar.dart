import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            children: [
              navItem(
                'assets/icons/home.svg',
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                'assets/icons/ticket.svg',
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              const SizedBox(width: 80),
              navItem(
                'assets/icons/gift.svg',
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              navItem(
                'assets/icons/user.svg',
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget navItem(String icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          color: selected ? AppColors.green : AppColors.stack,
        )),
  );
}
