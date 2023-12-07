import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:flutter/material.dart';

class CategoryCircleBtn extends StatelessWidget {
  final String text;
  final String imagePath;
  final double imageSize;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;

  const CategoryCircleBtn({
    Key? key,
    required this.text,
    required this.imagePath,
    this.imageSize = 50,
    required this.fontSize,
    this.textColor = ColorConstant.white,
    this.backgroundColor = ColorConstant.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.125,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey.withOpacity(0.9),
            //       offset: Offset(1, 1),
            //       blurRadius: 10,
            //       spreadRadius: 2)
            // ]
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              color: Colors.grey,
              height: 26,
              width: 26,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
