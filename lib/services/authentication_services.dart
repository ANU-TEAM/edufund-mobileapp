import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:mobileapp/models/user.dart';
import 'package:mobileapp/utils/endpoints.dart';

class AuthenticationServices {
  static var client = http.Client();

  static Future<User> sendRegistationDetails(registerFormData) async {
    var response = await client.post(AppUrl.register, body: registerFormData);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userInfo = jsonResponse['data'];
      return userFromJson(convert.jsonEncode(userInfo));
    } else {
      return null;
    }
  }
}
