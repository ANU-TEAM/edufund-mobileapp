import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      child: Obx(() {
        if (applicationController.isLoading.value) {
          return Center(
            child: SpinKitPumpingHeart(
              color: Colors.green,
              size: 100,
            ),
          );
        }
        return ListView.builder(
          itemCount: applicationController.applicationList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              ApplicationCard(
                application: applicationController.applicationList[index],
              )
            ]);
          },
        );
      }),
    );
  }
}
