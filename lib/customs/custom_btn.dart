import 'package:flutter/material.dart';

Widget CustomBtn(
    context,
    double height,
    double width,
    Color btnColor,
    double borderRadius,
    String btnText,
    Color textColor,
    FontWeight fontWeight,
    double fontSize) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * height,
    width: MediaQuery.of(context).size.width * width,
    decoration: BoxDecoration(
        color: btnColor, borderRadius: BorderRadius.circular(borderRadius)),
    child: Text(
      btnText,
      style: TextStyle(
          color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    ),
  );
}
