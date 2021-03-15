import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/screens/profile/components/body.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ProfileScreen extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: GetX<UserPreferences>(builder: (userPreferences) {
        // userPreferences.removeUser();
        print(userPreferences.user.value.token);
        print(userPreferences.user.value.token != null);
        if (userPreferences.user.value.token != null) {
          return ProfileBody();
        } else {
          return Center(
            child: Column(
              children: [
                Text('Kindly login'),
                DefaultButton(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                  },
                  text: "Sign-In",
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
