import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:mobileapp/services/feedback_services.dart';

class FeedbackController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var errorMessage = ''.obs;

  Future<void> sendFeedbackData(feedbackData) async {
    try {
      isLoading(true);
      errorOccurred(false);
      var responseCode =
          await FeedbackServices.sendFeedbackDetails(feedbackData);
      if (responseCode != 200) {
        errorOccurred(true);
        errorMessage('Error occured when sending feedback.');
      }
    } on SocketException {
      errorOccurred(true);
      errorMessage('no internet connection?');
    } finally {
      isLoading(false);
    }
  }
}
