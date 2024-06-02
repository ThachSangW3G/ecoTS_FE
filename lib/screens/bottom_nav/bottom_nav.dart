import 'package:ecots_frontend/constants/app_colors.dart';
import 'package:ecots_frontend/models/nav_model.dart';
import 'package:ecots_frontend/screens/bottom_nav/account_screen.dart';
import 'package:ecots_frontend/screens/bottom_nav/gift_screen.dart';
import 'package:ecots_frontend/screens/bottom_nav/home_screen.dart';
import 'package:ecots_frontend/screens/bottom_nav/nav_bar.dart';
import 'package:ecots_frontend/screens/bottom_nav/ticket_screen.dart';
import 'package:ecots_frontend/screens/cameras/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final ticketKey = GlobalKey<NavigatorState>();
  final giftKey = GlobalKey<NavigatorState>();
  final accountKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items = [
      NavModel(
        page: const HomeScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const TicketScreen(),
        navKey: ticketKey,
      ),
      NavModel(
        page: const GiftScreen(),
        navKey: giftKey,
      ),
      NavModel(
        page: const AccountScreen(),
        navKey: accountKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () => {Get.to(() => const CameraScreen())},
          child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 75,
              width: 75,
              decoration: const BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: SvgPicture.asset('assets/icons/qr-code.svg'),
              )),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
