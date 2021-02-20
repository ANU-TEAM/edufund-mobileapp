import 'package:flutter/material.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/components/form_error.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/utils/contants.dart';

class ForgotPwdBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text("Reset Password",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 15,
              ),
              Text("Please enter your email and we will "
                  "\nsend you a link to reset your password",
              textAlign: TextAlign.center,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              ForgotPwdForm(),
            ],
          ),
        ),
      ),
    );
  }
}
class ForgotPwdForm extends StatefulWidget {
  @override
  _ForgotPwdFormState createState() => _ForgotPwdFormState();
}

class _ForgotPwdFormState extends State<ForgotPwdForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
            validator: (value) {
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
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: Icon(
                Icons.mail_outline,
                size: 30,
               ),
              ),
            ),
          ),

          FormError(errors: errors),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          DefaultButton(
            text: ("Continue"),
            press: (){
              if (_formKey.currentState.validate()) {
                print("Hello world");
              }  
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Remembered Your Password?",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

