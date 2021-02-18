import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login/components/body.dart';
// import 'package:mobileapp/utils/contants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
