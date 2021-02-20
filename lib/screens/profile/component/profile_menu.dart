import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}