import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import 'package:mobileapp/screens/home/component/body.dart';
import '../../enum.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.home,),
    );
  }
}
