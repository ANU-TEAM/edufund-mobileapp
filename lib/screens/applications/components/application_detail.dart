import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/application_description.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/linearprogressindicator.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final Application? application;

  const ApplicationDetailScreen({Key? key, this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        elevation: 3,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: DefaultButton(
            text: "Fund this student".toUpperCase(),
            press: () {
              // Get.to(PaymentPage());
              launch('https://paystack.com/pay/edufund');
            },
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
                  application!.imageUrl!,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      application!.user!.name!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // RaisedButton.icon(
                          //   color: kPrimaryColor,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Clipboard.setData(new ClipboardData(
                          //         text: application!.user!.name));
                          //   },
                          //   icon: Icon(
                          //     Icons.copy,
                          //     size: 20,
                          //   ),
                          //   label: Text('Copy Name'),
                          // )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          application!.title!,
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
                          application!.description!,
                          maxLines: 5,
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
                            Get.to(
                              () => ApplicationDescriptionScreen(
                                  description: application!.description),
                            );
                          },
                          child: Text(
                            "Read More",
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
                              (application!.progress! * 100)
                                      .toInt()
                                      .toString() +
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
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: LinearProgressIndicatorComponent(
                          lineHeight: 4.0,
                          percent: application!.progress,
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
}
