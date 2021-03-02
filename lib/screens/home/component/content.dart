import 'package:flutter/material.dart';
import 'package:mobileapp/components/content_data.dart';
import 'package:mobileapp/model/content_model.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contentmodel.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
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
          ]
        );
      },
    );
  }
}
