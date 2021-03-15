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

  String title;
  String description;
  double targetAmount;
  int selectedRadioListTile;

  @override
  void initState() {
    super.initState();
    selectedRadioListTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioListTile = val;
    });
  }

  final List<String> errors = [];

  String validateTitle(String value) {
    if (value.isEmpty && !errors.contains(kTitleNullError)) {
      setState(() {
        errors.add(kTitleNullError);
      });
    } else if (!titleValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidTitleError)) {
      setState(() {
        errors.add(kInvalidTitleError);
      });
    }
    return null;
  }

  String validateTargetAmount(String value) {
    if (value.isEmpty && !errors.contains(kTargetAmountNullError)) {
      setState(() {
        errors.add(kTargetAmountNullError);
      });
    } else if (!targetAmountValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidTargetAmountError)) {
      setState(() {
        errors.add(kInvalidTargetAmountError);
      });
    }
    return null;
  }

  String validateDescription(String value) {
    if (value.isEmpty && !errors.contains(kDescriptionNullError)) {
      setState(() {
        errors.add(kDescriptionNullError);
      });
    } else if (!descriptionValidatorRegExp.hasMatch(value) &&
        value.isNotEmpty &&
        !errors.contains(kInvalidDescriptionError)) {
      setState(() {
        errors.add(kInvalidDescriptionError);
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

  validateNewApplicationBtnAndSubmit() {
    if (validateAndSave()) {
      // Get.to(() => );
      print("Application Successfully");
    } else {
      print("Application Not Sent");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: applicationFormKey,
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
              text: "Send Application",
              press: validateNewApplicationBtnAndSubmit,
            ),
          ],
        ),
      ),
    );
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
                  builder: ((builder) => applicaitonImageBottomSheet()),
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

  TextFormField buildTitleForm() {
    return TextFormField(
      onSaved: (value) => title = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kTitleNullError)) {
          setState(() {
            errors.remove(kTitleNullError);
          });
        } else if (titleValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidTitleError)) {
          setState(() {
            errors.remove(kInvalidTitleError);
          });
        }
        return null;
      },
      validator: validateTitle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Title",
        hintText: "Enter Your Title",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.title_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  TextFormField buildTargetAmountFormField() {
    return TextFormField(
      onSaved: (value) => targetAmount = double.parse(value),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kTargetAmountNullError)) {
          setState(() {
            errors.remove(kTargetAmountNullError);
          });
        } else if (targetAmountValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidTargetAmountError)) {
          setState(() {
            errors.remove(kInvalidTargetAmountError);
          });
        }
        return null;
      },
      validator: validateTargetAmount,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Target Amount",
        hintText: "Enter Your Target Amount",
        hintStyle: TextStyle(
          color: Colors.black26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: Icon(
            Icons.money_outlined,
            size: 30,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
      ],
    );
  }

  TextFormField buildDesciptionFormField() {
    return TextFormField(
      onSaved: (value) => description = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kDescriptionNullError)) {
          setState(() {
            errors.remove(kDescriptionNullError);
          });
        } else if (descriptionValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidNameError)) {
          setState(() {
            errors.remove(kInvalidDescriptionError);
          });
        }
        return null;
      },
      validator: validateDescription,
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: "Description",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "Describe yourself...",
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

  Widget buildCategoryRadioButtons() {
    return Column(
      children: [
        RadioListTile(
          title: Text("Primary"),
          value: 0,
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
          title: Text("Tertiary"),
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
          title: Text("Apprenticeship"),
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
