import 'package:flutter/material.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ApplicationCard extends StatelessWidget {
  final Application application;

  const ApplicationCard({Key key, this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.network(
                      application.imageUrl,
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
                              application.user.name,
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
                      application.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(
                      application.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 20),
                    child: Container(
                      height: 1,
                      width: 350.0,
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
                          (application.progress * 100).toInt().toString() + '%',
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
                    padding: EdgeInsets.only(bottom: 10),
                    child: LinearProgressIndicator(
                      lineHeight: 4.0,
                      percent: application.progress,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LinearProgressIndicator extends StatelessWidget {
  final double width;
  final double lineHeight;
  final double percent;

  const LinearProgressIndicator({
    Key key,
    this.width,
    this.lineHeight,
    this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: width,
      lineHeight: lineHeight,
      percent: percent,
      backgroundColor: Colors.grey[100],
      progressColor: kPrimaryColor,
    );
  }
}
