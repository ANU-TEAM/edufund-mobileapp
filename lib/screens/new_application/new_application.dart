import 'package:flutter/material.dart';
import 'package:mobileapp/screens/new_application/component/body.dart';
import 'package:mobileapp/utils/contants.dart';

class NewApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Application"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: FlatButton(
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            height: 50.0,
            onPressed: () {},
            child: Text(
              "Submit Form".toUpperCase(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: NewApplicationBody(),
    );
  }
}
