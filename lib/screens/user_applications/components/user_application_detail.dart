import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/linearprogressindicator.dart';
import 'package:mobileapp/controllers/new_application_controller.dart';
import 'package:mobileapp/controllers/user_applications_controller.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/screens/edit_application/edit_application.dart';
import 'package:mobileapp/screens/new_application/new_application.dart';
import 'package:mobileapp/utils/contants.dart';

class UserApplicationDetailScreen extends StatelessWidget {
  final NewApplicationController newApplicationController =
      Get.put(NewApplicationController());
  final UserApplicationController userApplicationController =
      Get.put(UserApplicationController());

  final Application application;

  UserApplicationDetailScreen({Key key, this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: kPrimaryColor,
                  onPressed: () {
                    Get.to(() => EditApplicationScreen(
                          application: application,
                        ));
                  },
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: kDangerColor,
                  onPressed: () {
                    deleteApplication(application.id);
                  },
                  child: Text(
                    "DELETE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Image.network(
                  application.imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[100],
                            child: Icon(
                              Icons.edit,
                              color: kPrimaryColor,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Created By",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  application.user.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          application.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          application.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => NewApplicationScreen());
                          },
                          child: Text(
                            "Read More about " + "${application.user.name}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Text(
                              (application.progress * 100).toInt().toString() +
                                  '%',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Text(
                              'GHS ' + application.targetAmount.toString(),
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: LinearProgressIndicatorComponent(
                          lineHeight: 4.0,
                          percent: application.progress,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteApplication(int id) {
    newApplicationController.deleteApplicationData(id).whenComplete(() => {
          if (newApplicationController.errorOccurred.value)
            {
              Get.snackbar(
                'Error',
                '${newApplicationController.errorMessage.value}'.capitalize,
                backgroundColor: kDangerColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              ),
            }
          else
            {
              userApplicationController.fetchUserApplications(),
              Get.back(),
              Get.snackbar(
                'Success',
                'Application has been deleted successfully'.capitalize,
                backgroundColor: kPrimaryColor,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              ),
            }
        });
  }
}
