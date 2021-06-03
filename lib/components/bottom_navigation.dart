import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/info/info.dart';
import 'package:mobileapp/screens/new_application/new_application.dart';
import 'package:mobileapp/screens/profile/profile_screen.dart';
import 'package:mobileapp/utils/contants.dart';
import '../utils/enum.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.home_rounded,
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Get.to(() => HomeScreen());
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.add_box,
                color: MenuState.newApplication == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Get.to(() => NewApplicationScreen());
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.person,
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Get.to(() => ProfileScreen());
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.info_sharp,
                color: MenuState.info == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Get.to(() => InfoScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
