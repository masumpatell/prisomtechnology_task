import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import '../constant/app_color.dart';
import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final Icon prefixIcon;
  final Color? prefixIconColor;
  final TextEditingController controller;
  final String hintText;
  final bool hideText;
  final TextInputType keyType;

  const CustomTextField({
    super.key,
    required this.name,
    required this.prefixIcon,
    required this.controller,
    required this.hintText,
    this.prefixIconColor,
    required this.hideText,
    required this.keyType
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppDimens.size_20, right: AppDimens.size_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(name: widget.name, color: AppColor.white,fontFamily: "masum",fontSize: AppDimens.size_20,),
          Row(
            children: [
              Icon(
                widget.prefixIcon.icon,
                color: widget.prefixIconColor ?? AppColor.white,
              ),
              const SizedBox(width: AppDimens.size_5),
              Container(
                height: AppDimens.size_25,
                width: AppDimens.size_1,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  keyboardType: widget.keyType,
                  obscureText: widget.hideText,
                  controller: widget.controller,
                  style: TextStyle(
                    color: AppColor.white,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: AppColor.white)),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            height: AppDimens.size_1,
          )
        ],
      ),
    );
  }
}
