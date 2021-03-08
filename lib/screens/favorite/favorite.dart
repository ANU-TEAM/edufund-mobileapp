import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';
import '../../utils/enum.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 200.0),
          child: Text(
            "FAVORITE SCREEN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedMenu: MenuState.favorite,
      ),
    );
  }
}
