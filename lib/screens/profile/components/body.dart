import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/screens/profile/components/profile_menu.dart';
import 'package:mobileapp/screens/user_applications/user_application.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ProfileBody extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ProfileMenu(
          press: () {},
          text: "My Account",
          icon: Icons.person_outline,
        ),
        ProfileMenu(
          press: () {
            Get.to(() => UserApplicationScreen());
          },
          text: "My Applications",
          icon: Icons.pending_actions_outlined,
        ),
        ProfileMenu(
          press: () {},
          text: "Settings",
          icon: Icons.settings_outlined,
        ),
        ProfileMenu(
          press: () {
            userPreferences.removeUser();
          },
          text: "Sign-Out",
          icon: Icons.logout,
        ),
      ],
    );
  }
}
