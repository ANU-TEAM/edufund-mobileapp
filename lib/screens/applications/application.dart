import 'package:flutter/material.dart';
import 'package:mobileapp/screens/applications/components/application_list.dart';
import 'package:mobileapp/screens/applications/components/categories_section.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              CategoriesSection(),
              SizedBox(
                height: 15.0,
              ),
              ApplicationList(),
            ],
          ),
        ),
      ),
    );
  }
}
