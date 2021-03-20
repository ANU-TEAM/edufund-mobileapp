import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/screens/auth/login/login.dart';

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
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: DefaultButton(
              press: () {
                Get.to(() => LoginScreen());
              },
              text: 'Log In',
            ),
          ),
        ],
      ),
    );
  }
}
