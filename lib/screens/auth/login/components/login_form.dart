import 'package:flutter/material.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/form_error.dart';
import 'package:mobileapp/screens/auth/forgot_pwd/forgot_pwd.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/utils/contants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  String validateEmail(String value) {
    if (value.isEmpty && !errors.contains(kEmailNullError)) {
      setState(() {
        errors.add(kEmailNullError);
      });
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.add(kInvalidEmailError);
      });
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty && !errors.contains(kPassNullError)) {
      setState(() {
        errors.add(kPassNullError);
      });
    } else if (value.length < 8 &&
        value.isNotEmpty &&
        !errors.contains(kShortPassError)) {
      setState(() {
        errors.add(kShortPassError);
      });
    }
    return null;
  }

  bool validateAndSave() {
    final form = _loginFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  validateLoginBtnAndSubmit() {
    if (validateAndSave()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      print("Login is Successful");
    } else {
      print("Login Not Successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 30),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: 20),
          DefaultButton(
            text: "Continue",
            press: validateLoginBtnAndSubmit,
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: validateEmail,
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
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: validatePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.lock_outline,
            size: 30,
          ),
        ),
      ),
    );
  }
}
