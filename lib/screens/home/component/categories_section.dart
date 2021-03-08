import 'package:flutter/material.dart';
import 'package:mobileapp/screens/home/component/category_item.dart';
import 'package:mobileapp/utils/contants.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryItem(
          text: "Primary",
          onTap: () {},
          color: kPrimaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        CategoryItem(
          text: "Secondary",
          onTap: () {},
          color: Colors.lightGreen,
        ),
        SizedBox(
          width: 5,
        ),
        CategoryItem(
          text: "Tertiary",
          onTap: () {},
          color: Colors.lightGreen,
        ),
        SizedBox(
          width: 5,
        ),
        CategoryItem(
          text: "Apprenticeship",
          onTap: () {},
          color: Colors.lightGreen,
        ),
      ],
    );
  }
}
