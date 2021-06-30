import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/components/linearprogressindicator.dart';
import 'package:mobileapp/screens/applications/components/application_detail.dart';

class ApplicationCard extends StatelessWidget {
  final Application? application;

  const ApplicationCard({Key? key, this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => ApplicationDetailScreen(
                    application: application,
                  ));
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
