import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/forgot_pwd/fogot_pwd_form.dart';

class ForgotPwdBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your email and we will "
                "\nsend you a link to reset your password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              ForgotPwdForm(),
            ],
          ),
        ),
      ),
    );
  }
}
