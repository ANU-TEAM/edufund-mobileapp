import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/services/application_services.dart';

class ApplicationController extends GetxController {
  var isLoading = true.obs;
  var errorOccurred = false.obs;
  var errorMessage = 'no internet connection'.obs;
  var applicationList = List<Application>().obs;

  @override
  void onInit() {
    fetchApplications();
    super.onInit();
  }

  Future<void> fetchApplications() async {
    try {
      isLoading(true);
      errorOccurred(false);
      var applications = await ApplicationServices.fetchApplications();
      if (applications != null) {
        applicationList.assignAll(applications);
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
