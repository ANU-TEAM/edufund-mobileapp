import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:mobileapp/controllers/user_applications_controller.dart';
import 'package:mobileapp/screens/new_application/new_application.dart';
import 'package:mobileapp/screens/user_applications/components/user_application_card.dart';
import 'package:mobileapp/utils/contants.dart';

class UserApplicationList extends StatelessWidget {
  final UserApplicationController userApplicationController =
      Get.put(UserApplicationController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (userApplicationController.isLoading.value) {
          return Center(
            child: SpinKitPumpingHeart(
              color: Colors.green,
              size: 100,
            ),
          );
        } else if (userApplicationController.errorOccurred.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nointernet.svg",
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  userApplicationController.errorMessage.value.capitalize,
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
                userApplicationController.noApplications.value
                    ? FlatButton(
                        onPressed: () {
                          Get.to(() => NewApplicationScreen());
                        },
                        color: kPrimaryColor,
                        height: 50.0,
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    : FlatButton(
                        onPressed:
                            userApplicationController.fetchUserApplications,
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
                      ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: userApplicationController.fetchUserApplications,
          child: ListView.builder(
            itemCount: userApplicationController.applicationList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                UserApplicationCard(
                  application: userApplicationController.applicationList[index],
                )
              ]);
            },
          ),
        );
      }),
    );
  }
}
