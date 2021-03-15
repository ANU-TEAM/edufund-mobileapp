import 'package:flutter/material.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/screens/applications/components/application_list.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Home",
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // CategoriesSection(),
                // SizedBox(
                //   height: 15.0,
                // ),
                ApplicationList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
