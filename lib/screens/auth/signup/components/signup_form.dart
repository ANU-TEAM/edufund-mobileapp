import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/loading_button.dart';
import 'package:mobileapp/controllers/user_controller.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/utils/contants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final UserController userController = Get.put(UserController());
  final _registerFormKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String deviceId = "Mobile";

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _registerFormKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: 30),
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 30),
          SizedBox(height: 20),
          Obx(
            () => buildRegisterButton(),
          ),
        ],
      ),
    );
  }

  void registerUser() {
    if (_registerFormKey.currentState.validate()) {
      _registerFormKey.currentState.save();
      userController.sendRegistrationData({
        'name': '$name',
        'email': '$email',
        'password': '$password',
        'deviceId': '$deviceId',
      }).whenComplete(() => {
            if (userController.errorOccurred.value)
              {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${userController.errorMessage.value}'.capitalize,
                    ),
                  ),
                )
              }
            else
              {
                Get.off(HomeScreen()),
                Get.snackbar(
                  "Welcome to Edufund",
                  'Your account was created successfully'.capitalize,
                ),
              }
          });
    }
  }

  Widget buildRegisterButton() {
    if (userController.isLoading.value) {
      return LoadingButton(
        text: "Registering",
      );
    } else {
      return DefaultButton(
        text: "Register",
        press: registerUser,
      );
    }
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kNameNullError;
        } else if (!nameValidatorRegExp.hasMatch(value)) {
          return kInvalidNameError;
        } else if (value.length < 4) {
          return kShortNameError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.person_outline,
            size: 30,
          ),
        ),
      ),
    );
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
