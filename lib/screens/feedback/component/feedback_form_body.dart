import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/controllers/feedback_controller.dart';
import 'package:mobileapp/utils/contants.dart';

class FeedbackFormBody extends StatefulWidget {
  FeedbackFormBody({Key key}) : super(key: key);

  @override
  _FeedbackFormBodyState createState() => _FeedbackFormBodyState();
}

class _FeedbackFormBodyState extends State<FeedbackFormBody> {
  final FeedbackController feedbackController = Get.put(FeedbackController());
  final feedbackKey = GlobalKey<FormState>();

  double rating = 4;
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
              SvgPicture.asset(
                "assets/icons/feedback.svg",
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "We would Appreciate Your Feedback To Improve the App."
                    .capitalize,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "How would you rate the App?",
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
                press: sendFeedback,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendFeedback() {
    if (feedbackKey.currentState.validate()) {
      feedbackKey.currentState.save();
      feedbackController.sendFeedbackData({
        'rating': '$rating',
        'comment': '$comment',
      }).whenComplete(() => {
            if (feedbackController.errorOccurred.value)
              {
                Get.snackbar(
                  'Error',
                  '${feedbackController.errorMessage.value}'.capitalize,
                  backgroundColor: kDangerColor,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                ),
              }
            else
              {
                Get.snackbar(
                  "Thank You",
                  'Your feedback has been sent.'.capitalize,
                  backgroundColor: kPrimaryColor,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                ),
              }
          });
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
      onRatingUpdate: (userrating) => rating = userrating,
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
