import 'package:flutter/material.dart';
import 'package:mobileapp/screens/auth/login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("HOME"),
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
