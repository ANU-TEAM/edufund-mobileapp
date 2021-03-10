import 'package:flutter/material.dart';
import 'package:mobileapp/components/linearprogressindicator.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/utils/contants.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final Application application;

  const ApplicationDetailScreen({Key key, this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        actions: [
          IconButton(
              icon: Icon(Icons.favorite_border_outlined), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: FlatButton(
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 50.0,
              onPressed: () {},
              child: Text(
                "fund this student".toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
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
                  padding: EdgeInsets.all(15.0),
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
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        application.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
                      child: Text(
                        "Read More about " + "${application.user.name}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 8),
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
                          padding: EdgeInsets.only(right: 8, bottom: 8),
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
                      padding:
                          EdgeInsets.only(top: 20.0, right: 8.0, left: 8.0),
                      child: LinearProgressIndicatorComponent(
                        lineHeight: 4.0,
                        percent: application.progress,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
