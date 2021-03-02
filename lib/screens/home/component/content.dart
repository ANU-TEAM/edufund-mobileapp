import 'package:flutter/material.dart';
import 'package:mobileapp/components/content_data.dart';
import 'package:mobileapp/model/content_model.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: contentmodel.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            ContentData(
              image: contentmodel[index].image,
              name: contentmodel[index].name,
              title: contentmodel[index].title,
              message: contentmodel[index].message,
              amount: contentmodel[index].amount,
              percentage: contentmodel[index].percentage,
            ),
          ]);
        },
      ),
    );
  }
}
