import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressIndicatorComponent extends StatelessWidget {
  final double? width;
  final double? lineHeight;
  final double? percent;

  const LinearProgressIndicatorComponent({
    Key? key,
    this.width,
    this.lineHeight,
    this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: width,
      lineHeight: lineHeight!,
      percent: (percent! > 1.0) ? 1.0 : percent!,
      backgroundColor: Colors.grey[100],
      progressColor: kPrimaryColor,
    );
  }
}
