import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:mobileapp/controllers/application_controller.dart';
import 'package:mobileapp/screens/applications/components/application_card.dart';
import 'package:mobileapp/utils/contants.dart';

class ApplicationList extends StatelessWidget {
  final ApplicationController applicationController =
      Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (applicationController.isLoading.value) {
          return Center(
            // child: SpinKitPumpingHeart(
            //   color: kPrimaryColor,
            //   size: 100,
            // ),
            child: CircularProgressIndicator(),
          );
        } else if (applicationController.errorOccurred.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nointernet.svg",
                  width: MediaQuery.of(context).size.width,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  applicationController.errorMessage.value.capitalize!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: applicationController.fetchApplications,
                  color: kPrimaryColor,
                  height: 50.0,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    "Retry",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: applicationController.fetchApplications,
          child: ListView.builder(
            itemCount: applicationController.applicationList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                ApplicationCard(
                  application: applicationController.applicationList[index],
                )
              ]);
            },
          ),
        );
      }),
    );
  }
}
