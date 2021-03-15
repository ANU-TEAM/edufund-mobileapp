import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/services/authentication_services.dart';

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
      } else {
        errorOccurred(true);
        errorMessage('Email is alreay taken.');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } on HttpException {
      errorOccurred(true);
      errorMessage('Could not find the item');
    } on FormatException {
      errorOccurred(true);
      errorMessage('Invalid response format');
    } finally {
      isLoading(false);
    }
  }
}
