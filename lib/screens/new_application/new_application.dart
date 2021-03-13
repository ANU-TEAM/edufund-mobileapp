import 'package:flutter/material.dart';
import 'package:mobileapp/screens/new_application/component/body.dart';

class NewApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NewApplicationBody(),
      ),
    );
  }
}
