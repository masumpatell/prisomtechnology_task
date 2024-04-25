import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_color.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';

Widget CustomeAddField(
    context,
    double height,
    double width,
    TextEditingController controller,
    String hintText,
    Color textColor,
    var fWidth,
    double fSize,
    double leftp,
    double rightp,
    double leftm,
    double rightm,
    TextInputType kyebordType
    ) {
  return Container(
    padding: EdgeInsets.only(left: leftp,right: rightp),
    margin: EdgeInsets.only(left: leftm,right: rightm),
    height: MediaQuery.of(context).size.height * height,
    width: MediaQuery.of(context).size.width * width,
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.green, width: AppDimens.size_2),
        borderRadius: BorderRadius.circular(20)),
    child: TextField(
      maxLines: 4,
      keyboardType: kyebordType,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle:
              TextStyle(color: textColor, fontWeight: fWidth, fontSize: fSize)),
    ),
  );
}
