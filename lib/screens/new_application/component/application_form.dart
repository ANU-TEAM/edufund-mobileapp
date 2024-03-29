import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/loading_button.dart';
import 'package:mobileapp/controllers/new_application_controller.dart';
import 'package:mobileapp/controllers/school_controller.dart';
import 'package:mobileapp/models/newApplication.dart';
import 'package:mobileapp/models/school.dart';
import 'package:mobileapp/screens/home/home.dart';
import 'package:mobileapp/screens/user_applications/components/user_application_detail.dart';
import 'package:mobileapp/screens/user_applications/user_application.dart';
import 'package:mobileapp/utils/contants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final NewApplicationController newApplicationController =
      Get.put(NewApplicationController());
  final SchoolController schoolController = Get.put(SchoolController());
  final _applicationFormKey = GlobalKey<FormState>();

  String? title;
  String? description;
  double? targetAmount;
  String schoolId = '1';
  int? categoryId = 1;

  File? _chosenImage;
  CroppedFile? _croppedImage;
  var isImageChosen = false;
  final picker = ImagePicker();

  Future takeImage(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      _croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.ratio16x9]
            : [CropAspectRatioPreset.ratio16x9],
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: kPrimaryColor,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: kPrimaryColor,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
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
            buildSelectSchoolInput(context),
            SizedBox(
              height: 20,
            ),
            buildCategoryRadioButtons(),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => buildSubmitButton(),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    if (newApplicationController.isLoading.value) {
      return LoadingButton(
        text: "Loading",
      );
    } else {
      return DefaultButton(
        text: "Submit",
        press: submitApplication,
      );
    }
  }

  void submitApplication() {
    if (_applicationFormKey.currentState!.validate()) {
      _applicationFormKey.currentState!.save();
      if (_chosenImage == null) {
        showModalBottomSheet(
          context: context,
          builder: ((builder) => applicationImageBottomSheet(
              title: "Please choose an image to continue.")),
        );
      } else {
        newApplicationController
            .sendNewApplicationData(
              NewApplication(
                title: title,
                description: description,
                imageUrl: _chosenImage,
                targetAmount: targetAmount,
                school: int.parse(schoolId),
                category: categoryId,
              ),
            )
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
                              newApplicationController.newApplication.value,
                        ),
                      ),
                      Get.snackbar(
                        "Awesome",
                        'Application has been submitted successfully'
                            .capitalize!,
                        backgroundColor: kPrimaryColor,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      ),
                    }
                });
      }
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
              image: (isImageChosen == false
                  ? AssetImage("assets/images/placeholder.png")
                  : FileImage(_chosenImage!)) as ImageProvider<Object>,
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

  Widget buildSelectSchoolInput(BuildContext context) {
    List<School> schoolList = schoolController.schoolsList;

    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        hint: Text('Select School'),
        value: schoolId,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.green[700],
        ),
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
          color: Colors.green,
        ),
        onChanged: (String? newValue) {
          setState(() {
            schoolId = newValue!;
          });
        },
        items: schoolList.map(
          (school) {
            return DropdownMenuItem<String>(
              value: '${school.id}',
              child: Text(
                '${school.name}',
              ),
            );
          },
        ).toList(),
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
