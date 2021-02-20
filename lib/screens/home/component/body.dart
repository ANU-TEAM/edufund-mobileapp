import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 200.0),
            child: Text("HOME SCREEN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          ),
        )
      ],
    );
  }
}
