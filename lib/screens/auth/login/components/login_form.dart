import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/loading_button.dart';
import 'package:mobileapp/controllers/user_controller.dart';
import 'package:mobileapp/screens/auth/forgot_pwd/forgot_pwd.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/utils/contants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final UserController userController = Get.put(UserController());
  final _loginFormKey = GlobalKey<FormState>();

  String email;
  String password;
  String deviceId = "Mobile";

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  Get.to(() => ForgotPasswordScreen());
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
          SizedBox(height: 20),
          Obx(
            () => buildLoginButton(),
          ),
        ],
      ),
    );
  }

  void loginUser() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();
      userController.sendLoginData({
        'email': '$email',
        'password': '$password',
        'deviceId': '$deviceId',
      }).whenComplete(() => {
            if (userController.errorOccurred.value)
              {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: kPrimaryColor,
                    content: Text(
                      '${userController.errorMessage.value}'.capitalize,
                    ),
                  ),
                )
              }
            else
              {
                Get.offAll(HomeScreen()),
                Get.snackbar(
                  "Welcome Back",
                  'You have successfully logged in.'.capitalize,
                ),
              }
          });
    }
  }

  Widget buildLoginButton() {
    if (userController.isLoading.value) {
      return LoadingButton(
        text: "Logging In",
      );
    } else {
      return DefaultButton(
        text: "Log In",
        press: loginUser,
      );
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
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
