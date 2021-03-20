import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/not_logged_in.dart';
import 'package:mobileapp/screens/new_application/component/application_form.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class NewApplicationScreen extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          userPreferences.getUser();
          if (userPreferences.user.value.token != null) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: ApplicationForm(),
            );
          } else {
            return NotLoggedInWidget();
          }
        }),
      ),
    );
  }
}
