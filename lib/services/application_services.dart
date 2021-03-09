import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/application.dart';

class ApplicationServices {
  static var client = http.Client();

  static Future<List<Application>> fetchApplications() async {
    var response =
        await client.get('https://edufundanu.herokuapp.com/api/applications');

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var applications = jsonResponse['data'];
      return applicationFromJson(convert.jsonEncode(applications));
    } else {
      return null;
    }
  }
}
