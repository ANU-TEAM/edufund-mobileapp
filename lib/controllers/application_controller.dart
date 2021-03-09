import 'package:get/state_manager.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/services/remote_services.dart';

class ApplicationController extends GetxController {
  var applicationList = List<Application>().obs;

  @override
  void onInit() {
    fetchApplications();
    super.onInit();
  }

  void fetchApplications() async {
    var applications = await RemoteServices.fetchApplications();
    if (applications != null) {
      applicationList.assignAll(applications);
    }
  }
}
