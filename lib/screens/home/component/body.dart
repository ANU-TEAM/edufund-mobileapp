import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/component/top_section.dart';

import 'content.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopSection(),
        SizedBox(height: 15.0,),
        BodyContent(),
      ],
    );

  }
}



