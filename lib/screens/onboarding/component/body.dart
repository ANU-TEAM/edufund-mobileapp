import 'package:flutter/material.dart';
import 'package:mobileapp/components/default_button.dart';
import 'package:mobileapp/screens/auth/login/login.dart';
import 'package:mobileapp/utils/contants.dart';

import 'onboarding_content.dart';

class OnboardingBody extends StatefulWidget {
  @override
  _OnboardingBodyState createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "We think about your fees, "
          "you think about studies",
      "image": "assets/images/edufund_2.png",
    },
    {
      "text": "We think about your fees, "
          "you think about studies",
      "image": "assets/images/edufund_3.png",
    },
    {
      "text": "We think about your fees, "
          "you think about studies",
      "image": "assets/images/edufund_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: splashData.length,
                  onPageChanged: (value){
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    text: splashData[index]['text'],
                    image: splashData[index]['image'],
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDots(index: index),
                      ),
                    ),
                    Spacer(flex: 3,),
                    DefaultButton(
                      text: "Continue",
                      press: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDots ({int index}){
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}




