import 'package:flutter/material.dart';
import 'package:mobileapp/screens/favorite/favorite.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/info/info.dart';
import 'package:mobileapp/screens/message/message.dart';
import 'package:mobileapp/screens/profile/profile_screen.dart';
import 'package:mobileapp/utils/contants.dart';
import '../utils/enum.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final inActiveIconColor = Color(0xFFB6B6B6);

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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.favorite,
                color: MenuState.favorite == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FavoriteScreen()));
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(
                Icons.add_box,
                color: MenuState.chat == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MessageScreen()));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfileScreen()));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => InfoScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
