import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/utils/endpoints.dart';

class AuthenticationServices {
  static var client = http.Client();

  static Future<User> sendRegistationDetails(registerFormData) async {
    var response = await client.post(
      AppUrl.register,
      headers: {
        'Accept': 'application/json',
      },
      body: registerFormData,
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userInfo = jsonResponse['data'];
      return userFromJson(convert.jsonEncode(userInfo));
    } else {
      return null;
    }
  }

  static Future<User> sendLoginDetails(loginFormData) async {
    var response = await client.post(
      AppUrl.login,
      headers: {
        'Accept': 'application/json',
      },
      body: loginFormData,
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userInfo = jsonResponse['data'];
      return userFromJson(convert.jsonEncode(userInfo));
    } else {
      return null;
    }
  }

  static Future sendResetDetails(email) async {
    var response = await client.post(
      AppUrl.forgotPassword,
      headers: {
        'Accept': 'application/json',
      },
      body: Icons.email_outlined,
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var message = jsonResponse['message'];
      return message;
    } else {
      return null;
    }
  }
}
