import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/screens/feedback/feedback.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                "EDUFUND",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: DefaultButton(
                text: ("Send Feedback"),
                press: () {
                  Get.to(() => FeedbackScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
