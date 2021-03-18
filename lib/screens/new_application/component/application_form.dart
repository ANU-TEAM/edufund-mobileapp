import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:image_picker/image_picker.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _applicationFormKey = GlobalKey<FormState>();

  String title;
  String description;
  double targetAmount;
  int selectedRadioListTile = 1;

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

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioListTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _applicationFormKey,
        child: Column(
          children: [
            buildApplicationImageForm(),
            SizedBox(
              height: 20,
            ),
            buildTitleForm(),
            SizedBox(
              height: 20,
            ),
            buildDesciptionFormField(),
            SizedBox(
              height: 20,
            ),
            buildTargetAmountFormField(),
            SizedBox(
              height: 20,
            ),
            buildCategoryRadioButtons(),
            SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: "Submit",
              press: submitApplication,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  void submitApplication() {
    if (_applicationFormKey.currentState.validate()) {
      _applicationFormKey.currentState.save();
      if (_chosenImage == null) {
        showModalBottomSheet(
          context: context,
          builder: ((builder) => applicationImageBottomSheet(
              title: "Please choose an image to continue.")),
        );
      } else {
        print('Image is chosen');
        print(_chosenImage);
      }

      // userController.sendLoginData({
      //   'email': '$email',
      //   'password': '$password',
      //   'deviceId': '$deviceId',
      // }).whenComplete(() => {
      //       if (userController.errorOccurred.value)
      //         {
      //           Scaffold.of(context).showSnackBar(
      //             SnackBar(
      //               backgroundColor: kPrimaryColor,
      //               content: Text(
      //                 '${userController.errorMessage.value}'.capitalize,
      //               ),
      //             ),
      //           )
      //         }
      //       else
      //         {
      //           Get.offAll(HomeScreen()),
      //           Get.snackbar(
      //             "Welcome Back",
      //             'You have successfully logged in.'.capitalize,
      //           ),
      //         }
      //     });
    }
  }

  Widget buildApplicationImageForm() {
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
                  ? AssetImage("assets/images/placeholder.png")
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
                  builder: ((builder) =>
                      applicationImageBottomSheet(title: "Select an Image")),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: kPrimaryColor,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget applicationImageBottomSheet({String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton.icon(
              onPressed: () {
                takeImage(ImageSource.camera);
              },
              icon: Icon(Icons.camera_alt_rounded, color: kPrimaryColor),
              label: Text("Camera"),
            ),
            FlatButton.icon(
              onPressed: () {
                takeImage(ImageSource.gallery);
              },
              icon: Icon(Icons.image_rounded, color: kPrimaryColor),
              label: Text("Gallery"),
            ),
          ],
        ),
      ],
    );
  }

  TextFormField buildTitleForm() {
    return TextFormField(
      onSaved: (value) => title = value,
      validator: (value) {
        if (value.isEmpty) {
          return kTitleNullError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Title",
        hintText: "Enter Your Title",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTargetAmountFormField() {
    return TextFormField(
      onSaved: (value) {
        targetAmount = double.parse(value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return kTargetAmountNullError;
        }
        return null;
      },
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Target Amount",
        hintText: "Enter Your Target Amount",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.gps_fixed_outlined,
            size: 30,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9.]+')),
      ],
    );
  }

  TextFormField buildDesciptionFormField() {
    return TextFormField(
      onSaved: (value) => description = value,
      validator: (value) {
        if (value.isEmpty) {
          return kDescriptionNullError;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Tell us your story",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget buildCategoryRadioButtons() {
    return Column(
      children: [
        RadioListTile(
          title: Text("Primary"),
          value: 1,
          groupValue: selectedRadioListTile,
          selected: false,
          activeColor: Colors.green,
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
        ),
        buildRadioListTileDividers(),
        RadioListTile(
          title: Text("Secondary"),
          value: 2,
          groupValue: selectedRadioListTile,
          selected: false,
          activeColor: Colors.green,
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
        ),
        buildRadioListTileDividers(),
        RadioListTile(
          title: Text("Tertiary"),
          value: 3,
          groupValue: selectedRadioListTile,
          selected: false,
          activeColor: Colors.green,
          onChanged: (val) {
            setSelectedRadioTile(val);
          },
        ),
        buildRadioListTileDividers(),
      ],
    );
  }
}

Widget buildRadioListTileDividers() {
  return Divider(
    height: 2,
    thickness: 2,
    indent: 20,
    endIndent: 20,
    color: Colors.grey[200],
  );
}
