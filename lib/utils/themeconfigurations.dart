import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

ThemeData themeConfigurations() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 18,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
