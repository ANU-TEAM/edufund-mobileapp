import 'package:flutter/material.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/screens/user_applications/components/user_application_list.dart';

class UserApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "My Applications",
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                UserApplicationList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
