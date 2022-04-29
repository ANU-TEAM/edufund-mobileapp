import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/components/linearprogressindicator.dart';
import 'package:mobileapp/screens/user_applications/components/user_application_detail.dart';
import 'package:mobileapp/utils/contants.dart';

class UserApplicationCard extends StatelessWidget {
  final Application? application;

  const UserApplicationCard({Key? key, this.application}) : super(key: key);

  Text generateStatus(int? status) {
    if (status == 0) {
      return Text(
        "Pending",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 1) {
      return Text(
        "Approved",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 2) {
      return Text(
        "Rejected",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (status == 3) {
      return Text(
        "Sponsored",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        "",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(
                () => UserApplicationDetailScreen(
                  application: application,
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Image.network(
                        application!.imageUrl!,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 180,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 22,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black54,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Text(
                                application!.user!.name!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            application!.title!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: generateStatus(application!.approved),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Text(
                        application!.description!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            (application!.progress! * 100).toInt().toString() +
                                '%',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8, bottom: 8),
                          child: Text(
                            'GHS ' + application!.targetAmount.toString(),
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: LinearProgressIndicatorComponent(
                        lineHeight: 4.0,
                        percent: application!.progress,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
