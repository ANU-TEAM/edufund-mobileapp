import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/screens/profile/component/profile_menu.dart';
import 'package:mobileapp/screens/profile/component/profile_pic.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 10,
        ),
        ProfileMenu(
          press: () {},
          text: "My Account",
          icon: Icons.person_outline,
        ),
        ProfileMenu(
          press: () {},
          text: "Notifications",
          icon: Icons.notifications_outlined,
        ),
        ProfileMenu(
          press: () {},
          text: "Settings",
          icon: Icons.settings_outlined,
        ),
        ProfileMenu(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
          },
          text: "Sign-Out",
          icon: Icons.logout,
        ),
      ],
    );
  }
}
