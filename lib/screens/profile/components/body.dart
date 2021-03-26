import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/screens/profile/components/profile_menu.dart';
import 'package:mobileapp/screens/user_applications/user_application.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ProfileBody extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Icon(
          Icons.person,
          size: 96,
          color: kPrimaryColor,
        ),
        Text(
          userPreferences.user.value.user.name.capitalize,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        Text(
          userPreferences.user.value.user.email,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ProfileMenu(
          press: () {
            Get.to(() => UserApplicationScreen());
          },
          text: "My Applications",
          icon: Icons.pending_actions_outlined,
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
