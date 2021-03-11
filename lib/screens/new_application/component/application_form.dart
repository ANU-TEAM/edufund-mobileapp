import 'package:flutter/material.dart';
import 'package:mobileapp/utils/contants.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final applicationFormKey = GlobalKey<FormState>();

  String name;

  String email;
  String bio;

  final List<String> errors = [];

  String validateFirstName(String value) {
    if (value.isEmpty && !errors.contains(kNameNullError)) {
      setState(() {
        errors.add(kNameNullError);
      });
    } else if (!nameValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidNameError)) {
      setState(() {
        errors.add(kInvalidNameError);
      });
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty && !errors.contains(kEmailNullError)) {
      setState(() {
        errors.add(kEmailNullError);
      });
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.add(kInvalidEmailError);
      });
    }
    return null;
  }

  bool validateAndSave() {
    final form = applicationFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  validateLoginBtnAndSubmit() {
    if (validateAndSave()) {
      // Get.to(() => );
      print("Login is Successful");
    } else {
      print("Login Not Successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: applicationFormKey,
        child: Column(
          children: [
            Text(
              "Please Fill the form below".toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildFirstNameForm(),
            SizedBox(
              height: 30,
            ),
            buildEmailFormField(),
            SizedBox(
              height: 30,
            ),
            buildBioFormField(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildFirstNameForm() {
    return TextFormField(
      onSaved: (fName) => name = fName,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        } else if (nameValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidNameError)) {
          setState(() {
            errors.remove(kInvalidNameError);
          });
        }
        return null;
      },
      validator: validateFirstName,
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
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: validateEmail,
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

  TextFormField buildBioFormField() {
    return TextFormField(
      onSaved: (bio) => bio = bio,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        } else if (nameValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidNameError)) {
          setState(() {
            errors.remove(kInvalidNameError);
          });
        }
        return null;
      },
      validator: validateFirstName,
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: "Biography",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Write your appealing message here...",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        ),
      ),
    );
  }
}
