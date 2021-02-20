import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/profile/profile_screen.dart';
import 'package:mobileapp/utils/contants.dart';
import '../enum.dart';

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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          ),
          boxShadow: [BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )]
      ),
      padding: EdgeInsets.symmetric(vertical: 14),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: kPrimaryColor,
              icon: Icon(EvaIcons.home,
                color: MenuState.home == selectedMenu ? kPrimaryColor : inActiveIconColor,),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(EvaIcons.heart,
                color: MenuState.favorite == selectedMenu ? kPrimaryColor : inActiveIconColor,),
              onPressed: (){},
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(EvaIcons.messageSquare,
                color: MenuState.favorite == selectedMenu ? kPrimaryColor : inActiveIconColor,),
              onPressed: (){},
            ),
            IconButton(
              color: kPrimaryColor,
              icon: Icon(EvaIcons.person,
                color: MenuState.profile == selectedMenu ? kPrimaryColor : inActiveIconColor,),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}