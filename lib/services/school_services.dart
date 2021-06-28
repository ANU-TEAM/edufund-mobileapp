import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/school.dart';
import 'package:mobileapp/utils/endpoints.dart';

class SchoolServices extends GetConnect {
  static var client = http.Client();

  static Future<List<School>?> fetchSchools() async {
    var response = await client.get(Uri.parse(AppUrl.schools));

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var schools = jsonResponse['data'];
      return schoolFromJson(convert.jsonEncode(schools));
    } else {
      return null;
    }
  }
}
