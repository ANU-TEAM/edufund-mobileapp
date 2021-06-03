import 'package:http/http.dart' as http;
import 'package:mobileapp/utils/endpoints.dart';

class FeedbackServices {
  static var client = http.Client();

  static Future sendFeedbackDetails(feedbackData) async {
    var response = await client.post(
      Uri.parse(AppUrl.feedbacks),
      headers: {
        'Accept': 'application/json',
      },
      body: feedbackData,
    );

    return response.statusCode;
  }
}
