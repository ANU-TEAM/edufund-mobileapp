import 'package:flutter/material.dart';
import 'package:mobileapp/screens/new_application/component/application_form.dart';

class NewApplicationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ApplicationForm(),
    );
  }
}
