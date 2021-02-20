import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login/login.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnBoardingScreen()));
                },
                child: Text("HOME")),
            FlatButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              child: Text("GO TO LOGIN"),
            )
          ],
        ),
      ),
    );
  }
}
