import 'package:flutter/material.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/utils/contants.dart';

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

class ForgotPwdForm extends StatefulWidget {
  @override
  _ForgotPwdFormState createState() => _ForgotPwdFormState();
}

class _ForgotPwdFormState extends State<ForgotPwdForm> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _resetPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => email = newValue,
            validator: (value) {
              if (value.isEmpty) {
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return kInvalidEmailError;
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                child: Icon(
                  Icons.mail_outline,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          DefaultButton(
            text: ("Continue"),
            press: () {
              if (_resetPasswordFormKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Processing Data'),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
