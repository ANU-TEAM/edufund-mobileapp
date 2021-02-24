import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/screens/onboarding/onboarding_screen.dart';
import 'package:mobileapp/utils/themeconfigurations.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDU FUND',
      theme: themeConfigurations(),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => LoginScreen(),
        "first": (context) => OnboardingScreen(),
      },


    );
  }
}
