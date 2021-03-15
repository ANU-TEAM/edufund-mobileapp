import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/utils/contants.dart';

class FeedbackFormBody extends StatefulWidget {
  FeedbackFormBody({Key key}) : super(key: key);

  @override
  _FeedbackFormBodyState createState() => _FeedbackFormBodyState();
}

class _FeedbackFormBodyState extends State<FeedbackFormBody> {
  final feedbackKey = GlobalKey<FormState>();

  String name;
  String email;
  String message;

  final List<String> errors = [];

  bool validateAndSave() {
    final form = feedbackKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  validateLoginBtnAndSubmit() {
    if (validateAndSave()) {
      Get.to(() => HomeScreen());
    } else {}
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "We'd Appreciate Your Feedback To Improve Our App",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              buildFeedbackFormField(),
              SizedBox(
                height: 20,
              ),
              Text(
                "How would you rate our App",
                style: TextStyle(
                  color: Colors.black,
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
              buildNameFormField(),
              SizedBox(
                height: 30,
              ),
              buildEmailFormField(),
            ],
          ),
        ),
      ),
    );
  }

  RatingBar buildRatingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
      itemBuilder: (context, _) => Icon(
        Icons.favorite,
        color: kPrimaryColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  TextFormField buildFeedbackFormField() {
    return TextFormField(
      onSaved: (newValue) => message = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kMsgNullError;
        } else if (!msgValidatorRegExp.hasMatch(value)) {
          return kInvalidMsgError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Feedback",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Send Us Your Feedback...",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        ),
      ),
      maxLines: 5,
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kNameNullError;
        } else if (!nameValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Name",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Enter Full Name",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.person_outline,
            size: 30,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Email Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.mail_outline,
            size: 30,
          ),
        ),
      ),
    );
  }
}
