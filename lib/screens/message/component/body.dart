import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 200.0),
            child: Text("MESSAGE SCREEN",
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