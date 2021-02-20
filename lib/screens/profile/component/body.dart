import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
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
          press: () {  },
          text: "My Account",
          icon: EvaIcons.personOutline,
        ),
        ProfileMenu(
          press: () {  },
          text: "Notifications",
          icon: EvaIcons.bellOutline,
        ),
        ProfileMenu(
          press: () {  },
          text: "Settings",
          icon: EvaIcons.settingsOutline,
        ),
        ProfileMenu(
          press: () {  },
          text: "Sign-Out",
          icon: EvaIcons.logOutOutline,
        ),
      ],
    );
  }
}
