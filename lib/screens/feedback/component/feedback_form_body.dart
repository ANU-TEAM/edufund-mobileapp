import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/utils/contants.dart';

class FeedbackFormBody extends StatefulWidget {
  FeedbackFormBody({Key key}) : super(key: key);

  @override
  _FeedbackFormBodyState createState() => _FeedbackFormBodyState();
}

class _FeedbackFormBodyState extends State<FeedbackFormBody> {
  final feedbackKey = GlobalKey<FormState>();

  double rating;
  String comment;

  final List<String> errors = [];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: feedbackKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "We would Appreciate Your Feedback To Improve the App."
                    .capitalize,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "How would you rate the App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRatingBar(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              buildFeedbackFormField(),
              SizedBox(height: 20),
              DefaultButton(
                text: "Submit",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() {
    if (feedbackKey.currentState.validate()) {
      feedbackKey.currentState.save();
      // userController.sendLoginData({
      //   'email': '$email',
      //   'password': '$password',
      //   'deviceId': '$deviceId',
      // }).whenComplete(() => {
      //       if (userController.errorOccurred.value)
      //         {
      //           Get.snackbar(
      //             'Error',
      //             '${userController.errorMessage.value}'.capitalize,
      //             backgroundColor: kDangerColor,
      //             colorText: Colors.white,
      //             snackPosition: SnackPosition.BOTTOM,
      //           ),
      //         }
      //       else
      //         {
      //           Get.offAll(HomeScreen()),
      //           Get.snackbar(
      //             "Welcome Back",
      //             'You have successfully logged in.'.capitalize,
      //             backgroundColor: kPrimaryColor,
      //             colorText: Colors.white,
      //           ),
      //         }
      //     });
    }
  }

  RatingBar buildRatingBar() {
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
      itemBuilder: (context, _) => Icon(
        Icons.favorite,
        color: kPrimaryColor,
      ),
      onRatingUpdate: (userrating) {
        rating = userrating;
      },
    );
  }

  TextFormField buildFeedbackFormField() {
    return TextFormField(
      onSaved: (newValue) => comment = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kMsgNullError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Feedback",
        hintText: "Send Us Your Feedback...",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLines: 5,
    );
  }
}
