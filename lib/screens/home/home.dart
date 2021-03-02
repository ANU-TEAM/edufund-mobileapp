import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import 'package:mobileapp/components/custom_appbar.dart';
import 'package:mobileapp/screens/home/component/body.dart';
import '../../enum.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Students",
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
        child: HomeBody(),
      ),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.home,),
    );
  }
}
