import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:get/get.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/onboarding/onboarding_screen.dart';
import 'package:mobileapp/utils/themeconfigurations.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  String? paystackKey = dotenv.env['LIVE_PAYSTACK_PULIC_KEY'];

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 1);

  await PaystackClient.initialize(paystackKey!);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDU FUND',
      theme: themeConfigurations(),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => HomeScreen(),
        "first": (context) => OnboardingScreen(),
      },
    );
  }
}
