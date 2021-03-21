import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF4BAA24);
const kDangerColor = Color(0xFFAA244A);
const inActiveIconColor = Color(0xFFB6B6B6);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp nameValidatorRegExp = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
final RegExp msgValidatorRegExp = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
const String kMsgNullError = "Please Enter your Name";
const String kInvalidMsgError = "Please Enter Valid Email";
const String kNameNullError = "Please Enter your Name";
const String kShortNameError = "Name is too short";
const String kInvalidNameError = "Please enter both First and Last name";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kTitleNullError = "Please Enter Title";
final RegExp titleValidatorRegExp = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
const String kInvalidTitleError = "Please Enter A Valid Title";
const String kTargetAmountNullError = "Please Enter Amount";
final RegExp targetAmountValidatorRegExp =
    RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
const String kInvalidTargetAmountError = "Please Enter Only Digits";
const String kDescriptionNullError = "Please Describe yourself";
const String kInvalidDescriptionError = "Please Enter A Valid Description";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
