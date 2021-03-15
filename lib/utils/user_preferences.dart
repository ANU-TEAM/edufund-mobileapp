import 'package:mobileapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future saveUser(User userObj) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", userObj.user.name);
    prefs.setString("email", userObj.user.email);
    prefs.setString("token", userObj.token);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String token = prefs.getString("token");

    return User(
      user: UserClass(
        name: name,
        email: email,
      ),
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");
  }
}
