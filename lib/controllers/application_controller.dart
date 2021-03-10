import 'package:get/state_manager.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/services/application_services.dart';

class ApplicationController extends GetxController {
  var isLoading = true.obs;
  var networkError = false.obs;
  var applicationList = List<Application>().obs;

  @override
  void onInit() {
    fetchApplications();
    super.onInit();
  }

  Future<void> fetchApplications() async {
    try {
      isLoading(true);
      networkError(false);
      var applications = await ApplicationServices.fetchApplications();
      if (applications != null) {
        applicationList.assignAll(applications);
      } else {
        networkError(true);
      }
    } catch (e) {
      networkError(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
