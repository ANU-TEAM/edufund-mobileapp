import 'package:get/state_manager.dart';
import 'package:mobileapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences extends GetxController {
  var user = User().obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  Future<void> saveUser(User userObj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", userObj.user.name);
    prefs.setString("email", userObj.user.email);
    prefs.setString("token", userObj.token);
  }

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String token = prefs.getString("token");

    var userObject = User(
      user: UserClass(
        name: name,
        email: email,
      ),
      token: token,
    );

    user(userObject);
  }

  void removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");

    user(User());
  }
}
