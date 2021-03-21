import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/not_logged_in.dart';
import 'package:mobileapp/screens/profile/components/body.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ProfileScreen extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          userPreferences.getUser();
          if (userPreferences.user.value.token != null) {
            return ProfileBody();
          } else {
            return NotLoggedInWidget();
          }
        }),
      ),
    );
  }
}
