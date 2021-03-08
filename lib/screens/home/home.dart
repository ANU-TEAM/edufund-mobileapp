import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/screens/home/component/categories_section.dart';
import 'package:mobileapp/screens/home/component/content.dart';
import '../../utils/enum.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Students",
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
              BodyContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
