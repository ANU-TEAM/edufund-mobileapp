import 'package:flutter/material.dart';
import 'package:mobileapp/components/content_data.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentData(
          image: "assets/images/home_image.jpg",
          name: "Florence Hanson",
          title: "Aid To Pursue BEcon",
          message: "I started University last year but"
              " due to unfortunate reasons...",
          amount: "1,400",
          percentage: "89 %",
        ),
      ],
    );
  }
}


