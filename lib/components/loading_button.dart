import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobileapp/utils/contants.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: kPrimaryColor,
      onPressed: () {},
      minWidth: MediaQuery.of(context).size.width * 0.4,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text!,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SpinKitCircle(
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}
