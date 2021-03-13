import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:image_picker/image_picker.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final applicationFormKey = GlobalKey<FormState>();

  File _chosenImage;
  File _croppedImage;
  var isImageChosen = false;
  final picker = ImagePicker();

  Future takeImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    if (pickedFile != null) {
      _croppedImage = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
        androidUiSettings: AndroidUiSettings(
          toolbarColor: kPrimaryColor,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: kPrimaryColor,
          toolbarTitle: "Application Image",
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
        ),
      );
    }
    setState(() {
      if (_croppedImage != null) {
        _chosenImage = File(_croppedImage.path);
        isImageChosen = true;
        Navigator.of(context).pop();
      } else {
        isImageChosen = false;
      }
    });
  }

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
            buildUserImage(),
            SizedBox(
              height: 20,
            ),
            buildNameForm(),
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

  Widget buildUserImage() {
    return Center(
      child: Stack(
        children: [
          Container(
            child: Image(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 180,
              image: isImageChosen == false
                  ? AssetImage("assets/images/user.png")
                  : FileImage(_chosenImage),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => applicaitonImageBottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt_rounded,
                color: kPrimaryColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget applicaitonImageBottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text("Select an Image"),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takeImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_rounded),
                label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () {
                  takeImage(ImageSource.gallery);
                },
                icon: Icon(Icons.image_rounded),
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField buildNameForm() {
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
        hintText: "Enter Your Full Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
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
        hintText: "Write your message here...",
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
