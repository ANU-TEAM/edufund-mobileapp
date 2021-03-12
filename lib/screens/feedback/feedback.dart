import 'package:flutter/material.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/utils/contants.dart';
import 'component/feedback_form_body.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ("Feedback Form"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: FlatButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            height: 50.0,
            onPressed: () {},
            child: Text(
              "Submit Feedback".toUpperCase(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: FeedbackFormBody(),
    );
  }
}
