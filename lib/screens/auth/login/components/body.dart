import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login/components/login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password.",
                textAlign: TextAlign.center,
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
