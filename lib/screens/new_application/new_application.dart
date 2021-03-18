import 'package:flutter/material.dart';
import 'package:mobileapp/screens/new_application/component/application_form.dart';

class NewApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ApplicationForm(),
        ),
      ),
    );
  }
}
