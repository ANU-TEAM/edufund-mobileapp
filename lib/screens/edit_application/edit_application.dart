import 'package:flutter/material.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/screens/edit_application/component/edit_application_form.dart';

class EditApplicationScreen extends StatelessWidget {
  final Application application;
  EditApplicationScreen({this.application});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: EditApplicationForm(),
      ),
    );
  }
}
