import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }
}
