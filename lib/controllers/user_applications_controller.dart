import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/services/application_services.dart';

class UserApplicationController extends GetxController {
  var isLoading = true.obs;
  var errorOccurred = false.obs;
  var errorMessage = 'no internet connection'.obs;
  var applicationList = List<Application>().obs;

  @override
  void onInit() {
    fetchUserApplications();
    super.onInit();
  }

  Future<void> fetchUserApplications() async {
    try {
      isLoading(true);
      errorOccurred(false);
      var applications = await ApplicationServices.fetchUserApplications();
      if (applications != null && applications.isNotEmpty) {
        applicationList.assignAll(applications);
      } else {
        errorOccurred(true);
        errorMessage('No applications found');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } on ClientException {
      errorOccurred(true);
      errorMessage(
        'Could not retrive applications at this time. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }
}
