import 'package:flutter/material.dart';

import 'login_body.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: LoginBody(),
    );
  }
}