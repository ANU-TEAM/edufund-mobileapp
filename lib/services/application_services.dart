import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/models/newApplication.dart';
import 'package:mobileapp/utils/endpoints.dart';
import 'package:mobileapp/utils/user_preferences.dart';

class ApplicationServices extends GetConnect {
  static var client = http.Client();

  static Future<List<Application>> fetchApplications() async {
    var response = await client.get(AppUrl.applications);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var applications = jsonResponse['data'];
      return applicationFromJson(convert.jsonEncode(applications));
    } else {
      return null;
    }
  }

  Future<Application> newApplication(NewApplication newApplicationData) async {
    final UserPreferences userPreferences = Get.put(UserPreferences());
    userPreferences.getUser();
    var userToken = userPreferences.user.value.token;

    final form = FormData({
      'title': newApplicationData.title,
      'description': newApplicationData.description,
      'image_url':
          MultipartFile(newApplicationData.imageUrl, filename: 'sosu.png'),
      'target_amount': newApplicationData.targetAmount,
      'category_id': newApplicationData.category
    });

    var response = await post(
      AppUrl.applications,
      form,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + userToken,
      },
    );

    if (response.statusCode == 200) {
      var receivedApplication = response.body['data'];
      return Application.fromJson(receivedApplication);
    } else {
      return null;
    }
  }
}
