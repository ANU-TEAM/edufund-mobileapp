import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/forgot_pwd/body.dart';

class ForgotPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: ForgotPwdBody(),
    );
  }
}

