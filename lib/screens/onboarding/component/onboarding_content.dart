import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key key, this.text, this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("EDUFUND",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),),
        Text(text,
          textAlign: TextAlign.center,),
        Spacer(),
        Image.asset(image,
          height: 265,
          width: 235,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}