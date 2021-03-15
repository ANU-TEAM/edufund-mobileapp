import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/loading_button.dart';
import 'package:mobileapp/controllers/user_controller.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/utils/contants.dart';

class ForgotPwdForm extends StatefulWidget {
  @override
  _ForgotPwdFormState createState() => _ForgotPwdFormState();
}

class _ForgotPwdFormState extends State<ForgotPwdForm> {
  final UserController userController = Get.put(UserController());
  final _resetPasswordFormKey = GlobalKey<FormState>();
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _resetPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Obx(
            () => buildResetButton(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }

  void sendResetLink() {
    if (_resetPasswordFormKey.currentState.validate()) {
      _resetPasswordFormKey.currentState.save();
      userController.sendResetData({
        'email': '$email',
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
                  "Success",
                  'Reset link has been sent to your email'.capitalize,
                ),
              }
          });
    }
  }

  Widget buildResetButton() {
    if (userController.isLoading.value) {
      return LoadingButton(
        text: "Sending",
      );
    } else {
      return DefaultButton(
        text: "Send Reset Link",
        press: sendResetLink,
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
}
