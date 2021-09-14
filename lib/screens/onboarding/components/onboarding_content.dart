import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/utils/contants.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          "NJSC SUPPORT",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Spacer(),
        Container(
          child: Column(
            children: [
              SvgPicture.asset(
                image!,
                width: 200,
                height: 250,
                fit: BoxFit.cover,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
