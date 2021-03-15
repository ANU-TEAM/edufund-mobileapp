import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/services/authentication_services.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var errorMessage = 'no internet connection'.obs;
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
        print(receivedUserInfo.token);
        print(receivedUserInfo.user.name);
      } else {
        errorOccurred(true);
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
