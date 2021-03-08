import 'package:flutter/material.dart';
import 'package:mobileapp/components/application_card.dart';
import 'package:mobileapp/models/application_model.dart';

class ApplicationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: applications.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            ApplicationCard(
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
