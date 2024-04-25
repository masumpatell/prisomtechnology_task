import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String name;
  Color color;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;

  CustomText({super.key,required this.name,required this.color,this.fontWeight,this.fontSize,this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(name,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight,fontFamily: fontFamily));
  }
}
