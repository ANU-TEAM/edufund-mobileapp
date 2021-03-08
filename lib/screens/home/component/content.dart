import 'package:flutter/material.dart';
import 'package:mobileapp/components/content_data.dart';
import 'package:mobileapp/model/application_model.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: applications.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            ContentData(
              image: applications[index].image,
              name: applications[index].name,
              title: applications[index].title,
              message: applications[index].message,
              amount: applications[index].amount,
              percentage: applications[index].percentage,
            ),
          ]);
        },
      ),
    );
  }
}
