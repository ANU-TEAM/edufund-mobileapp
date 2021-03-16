import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
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
      if (applications != null && applications.isNotEmpty) {
        applicationList.assignAll(applications);
      } else if (applications.isEmpty) {
        errorOccurred(true);
        errorMessage('No Application has been submitted');
      } else {
        errorOccurred(true);
        errorMessage('Could not retrieve applications');
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
