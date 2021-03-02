import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContentData extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String message;
  final String amount;
  final String percentage;

  const ContentData({
    Key key,
    this.image,
    this.name,
    this.title,
    this.message,
    this.amount,
    this.percentage,
  }) : super(key: key);

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
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 22,
                        width: 370,
                        color: Colors.black54,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 5.0,
                              right: 5.0,
                            ),
                            child: Text(
                              name,
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
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(
                      message,
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
                          percentage,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8, bottom: 8),
                        child: Text(
                          amount,
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
                      percent: 0.93,
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
