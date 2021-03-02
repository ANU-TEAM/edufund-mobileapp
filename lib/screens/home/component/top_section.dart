import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/component/top_section_content.dart';
import 'package:mobileapp/utils/contants.dart';


class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TopSectionContent(text: "Primary", onTap: (){}, color: kPrimaryColor,),
        SizedBox(width: 5,),
        TopSectionContent(text: "Secondary", onTap: (){}, color: Colors.lightGreen,),
        SizedBox(width: 5,),
        TopSectionContent(text: "Tertiary", onTap: (){}, color: Colors.lightGreen,),
        SizedBox(width: 5,),
        TopSectionContent(text: "Apprenticeship", onTap: (){}, color: Colors.lightGreen,),
      ],
    );
  }
}


