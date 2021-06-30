import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/user.png"),
                backgroundColor: Colors.grey[200],
              ),
              Positioned(
                bottom: 0,
                right: -12,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: FlatButton(
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.grey[200]!),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
