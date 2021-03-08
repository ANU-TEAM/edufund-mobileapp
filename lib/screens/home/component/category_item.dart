import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;

  const CategoryItem({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
