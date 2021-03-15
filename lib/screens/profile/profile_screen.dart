import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/screens/profile/components/body.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ProfileScreen extends StatelessWidget {
  final UserPreferences userPreferences = Get.put(UserPreferences());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Obx(() {
        userPreferences.getUser();
        print(userPreferences.user.value.token);
        print(userPreferences.user.value.token != null);
        if (userPreferences.user.value.token != null) {
          return ProfileBody();
        } else {
          return NotLoggedInWidget();
        }
      }),
    );
  }
}

class NotLoggedInWidget extends StatelessWidget {
  const NotLoggedInWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/notlogin.svg",
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Log in to have access to more features',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          DefaultButton(
            press: () {
              Get.to(() => LoginScreen());
            },
            text: 'Log In',
          ),
        ],
      ),
    );
  }
}
