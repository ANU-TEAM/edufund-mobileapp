import 'package:flutter/material.dart';
import 'package:mobileapp/components/bottom_navigation.dart';

import '../../enum.dart';
import 'component/body.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        automaticallyImplyLeading: false,
      ),
      body: FavoriteBody(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.favorite,),
    );
  }
}
