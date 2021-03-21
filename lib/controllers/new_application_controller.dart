import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/models/newApplication.dart';
import 'package:mobileapp/services/application_services.dart';

class NewApplicationController extends GetxController {
  var isLoading = true.obs;
  var errorOccurred = false.obs;
  var errorMessage = 'no internet connection'.obs;
  var newApplication = Application().obs;

  Future<void> sendNewApplicationData(NewApplication newApplicationData) async {
    try {
      isLoading(true);
      errorOccurred(false);
      var receivedApplication =
          await ApplicationServices().newApplication(newApplicationData);
      if (receivedApplication != null) {
        newApplication(receivedApplication);
      } else {
        errorOccurred(true);
        errorMessage('Error occured when sending application.');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } on ClientException {
      errorOccurred(true);
      errorMessage(
        'Could not create application at this time. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteApplicationData(int applicationId) async {
    try {
      isLoading(true);
      errorOccurred(false);
      var isDeleted =
          await ApplicationServices.deleteApplication(applicationId);
      if (isDeleted != true) {
        errorOccurred(true);
        errorMessage('Error occured when deleting the application.');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } on ClientException {
      errorOccurred(true);
      errorMessage(
        'Could not create application at this time. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }
}
