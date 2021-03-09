import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:mobileapp/components/application_card.dart';
import 'package:mobileapp/controllers/application_controller.dart';

class ApplicationList extends StatelessWidget {
  final ApplicationController applicationController =
      Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: applicationController.applicationList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              ApplicationCard(
                  image: applicationController.applicationList[index].imageUrl,
                  name: applicationController.applicationList[index].user.name,
                  title: applicationController.applicationList[index].title,
                  message:
                      applicationController.applicationList[index].description,
                  amount:
                      applicationController.applicationList[index].targetAmount,
                  percentage:
                      applicationController.applicationList[index].progress),
            ]);
          },
        ),
      ),
    );
  }
}
