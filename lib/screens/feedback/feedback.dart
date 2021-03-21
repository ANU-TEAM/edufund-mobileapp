import 'package:flutter/material.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/utils/contants.dart';
import 'component/feedback_form_body.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "FeedBack",
      ),
      body: FeedbackFormBody(),
    );
  }
}
