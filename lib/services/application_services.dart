import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/models/editApplication.dart';
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

  static Future<List<Application>> fetchUserApplications() async {
    final UserPreferences userPreferences = Get.put(UserPreferences());
    userPreferences.getUser();
    var userToken = userPreferences.user.value.token;

    var response = await client.get(
      AppUrl.userApplications,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + userToken,
      },
    );

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
          MultipartFile(newApplicationData.imageUrl, filename: 'new.jpg'),
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

  Future<Application> editApplication(
      EditApplication editApplicationData) async {
    final UserPreferences userPreferences = Get.put(UserPreferences());
    userPreferences.getUser();
    var userToken = userPreferences.user.value.token;

    final form = FormData({
      'title': editApplicationData.title,
      'description': editApplicationData.description,
      'image_url':
          MultipartFile(editApplicationData.imageUrl, filename: 'update.jpg'),
      'target_amount': editApplicationData.targetAmount,
      'category_id': editApplicationData.category
    });

    var response = await post(
      AppUrl.applications + '/${editApplicationData.id}',
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

  static Future<bool> deleteApplication(int applicationId) async {
    final UserPreferences userPreferences = Get.put(UserPreferences());
    userPreferences.getUser();
    var userToken = userPreferences.user.value.token;

    var response = await client.delete(
      AppUrl.applications + "/$applicationId",
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + userToken,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
