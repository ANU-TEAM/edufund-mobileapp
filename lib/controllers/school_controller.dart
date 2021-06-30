import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:http/http.dart';
import 'package:mobileapp/models/school.dart';
import 'package:mobileapp/services/school_services.dart';

class SchoolController extends GetxController {
  var isLoading = true.obs;
  var errorOccurred = false.obs;
  var errorMessage = 'no internet connection'.obs;
  var schoolsList = List<School>.filled(0, School(), growable: true).obs;

  @override
  void onInit() {
    fetchSchools();
    super.onInit();
  }

  Future<void> fetchSchools() async {
    try {
      isLoading(true);
      errorOccurred(false);
      var schools = await SchoolServices.fetchSchools();
      if (schools != null && schools.isNotEmpty) {
        schoolsList.assignAll(schools);
      } else {
        errorOccurred(true);
        errorMessage('Could not retrieve schools');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } on ClientException {
      errorOccurred(true);
      errorMessage(
        'Could not retrive schools at this time. Please try again later.',
      );
    } finally {
      isLoading(false);
    }
  }
}
