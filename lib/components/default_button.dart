import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: kPrimaryColor,
      onPressed: press,
      minWidth: MediaQuery.of(context).size.width * 0.4,
      height: 50.0,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
