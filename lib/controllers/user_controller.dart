import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/services/authentication_services.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var errorMessage = ''.obs;
  var userObject = User().obs;

  Future<void> sendRegistrationData(userRegistrationInfo) async {
    try {
      isLoading(true);
      errorOccurred(false);
      var receivedUserInfo =
          await AuthenticationServices.sendRegistationDetails(
              userRegistrationInfo);
      if (receivedUserInfo != null) {
        userObject(receivedUserInfo);
        UserPreferences().saveUser(receivedUserInfo);
      } else {
        errorOccurred(true);
        errorMessage('Email is alreay taken.');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendLoginData(userLoginInfo) async {
    try {
      isLoading(true);
      errorOccurred(false);
      var receivedUserInfo =
          await AuthenticationServices.sendLoginDetails(userLoginInfo);
      if (receivedUserInfo != null) {
        userObject(receivedUserInfo);
        UserPreferences().saveUser(receivedUserInfo);
      } else {
        errorOccurred(true);
        errorMessage('Email or password entered is incorrect');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } finally {
      isLoading(false);
    }
  }
}
