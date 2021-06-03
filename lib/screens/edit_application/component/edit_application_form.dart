import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/controllers/new_application_controller.dart';
import 'package:mobileapp/controllers/user_applications_controller.dart';
import 'package:mobileapp/models/application.dart';
import 'package:mobileapp/models/editApplication.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/user_applications/components/user_application_detail.dart';
import 'package:mobileapp/screens/user_applications/user_application.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/utils/file_from_url.dart';

class EditApplicationForm extends StatefulWidget {
  final Application? application;
  EditApplicationForm({Key? key, this.application}) : super(key: key);

  @override
  _EditApplicationFormState createState() =>
      _EditApplicationFormState(application: this.application);
}

class _EditApplicationFormState extends State<EditApplicationForm> {
  final NewApplicationController newApplicationController =
      Get.put(NewApplicationController());
  final UserApplicationController userApplicationController =
      Get.put(UserApplicationController());
  final Application? application;
  final _applicationFormKey = GlobalKey<FormState>();

  _EditApplicationFormState({this.application});

  String? title;
  String? description;
  double? targetAmount;
  int? categoryId;

  File? _chosenImage;
  File? _croppedImage;
  var isImageChosen = false;
  final picker = ImagePicker();

  void initState() {
    categoryId = application!.category!.id;
    super.initState();
  }

  Future takeImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    if (pickedFile != null) {
      _croppedImage = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: kPrimaryColor,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: kPrimaryColor,
        ),
      );
    }
    setState(() {
      if (_croppedImage != null) {
        _chosenImage = File(_croppedImage!.path);
        isImageChosen = true;
        Navigator.of(context).pop();
      } else {
        isImageChosen = false;
      }
    });
  }

  setSelectedRadioTile(int? val) {
    setState(() {
      categoryId = val;
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
              text: "Save",
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

  void submitApplication() async {
    if (_applicationFormKey.currentState!.validate()) {
      _applicationFormKey.currentState!.save();
      if (_chosenImage == null) {
        _chosenImage = await urlToFile(application!.imageUrl!);
      }
      newApplicationController
          .sendEditApplicationData(EditApplication(
              id: application!.id,
              title: title,
              description: description,
              imageUrl: _chosenImage,
              targetAmount: targetAmount,
              category: categoryId))
          .whenComplete(() => {
                if (newApplicationController.errorOccurred.value)
                  {
                    Get.snackbar(
                      'Error',
                      '${newApplicationController.errorMessage.value}'
                          .capitalize!,
                      backgroundColor: kDangerColor,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    ),
                  }
                else
                  {
                    Get.offAll(HomeScreen()),
                    Get.to(() => UserApplicationScreen()),
                    Get.to(
                      () => UserApplicationDetailScreen(
                        application:
                            newApplicationController.editApplication.value,
                      ),
                    ),
                    userApplicationController.fetchUserApplications(),
                    Get.snackbar(
                      "Awesome",
                      'Application has been editted successfully. Kindly wait while we review.'
                          .capitalize!,
                      backgroundColor: kPrimaryColor,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    ),
                  }
              });
    }
  }

  Widget buildApplicationImageForm() {
    return Center(
      child: Stack(
        children: [
          Container(
            child: isImageChosen == true
                ? Image(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    height: 180,
                    image: FileImage(_chosenImage!),
                  )
                : Image.network(
                    widget.application!.imageUrl!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
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

  Widget applicationImageBottomSheet({required String title}) {
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
      initialValue: widget.application!.title,
      onSaved: (value) => title = value,
      validator: (value) {
        if (value!.isEmpty) {
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
      initialValue: widget.application!.targetAmount.toString(),
      onSaved: (value) {
        targetAmount = double.parse(value!);
      },
      validator: (value) {
        if (value!.isEmpty) {
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
      initialValue: widget.application!.description,
      onSaved: (value) => description = value,
      validator: (value) {
        if (value!.isEmpty) {
          return kDescriptionNullError;
        }
        return null;
      },
      keyboardType: TextInputType.multiline,
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
          groupValue: categoryId,
          selected: false,
          activeColor: Colors.green,
          onChanged: (dynamic val) {
            setSelectedRadioTile(val);
          },
        ),
        buildRadioListTileDividers(),
        RadioListTile(
          title: Text("Secondary"),
          value: 2,
          groupValue: categoryId,
          selected: false,
          activeColor: Colors.green,
          onChanged: (dynamic val) {
            setSelectedRadioTile(val);
          },
        ),
        buildRadioListTileDividers(),
        RadioListTile(
          title: Text("Tertiary"),
          value: 3,
          groupValue: categoryId,
          selected: false,
          activeColor: Colors.green,
          onChanged: (dynamic val) {
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
