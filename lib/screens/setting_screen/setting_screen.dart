import 'package:flutter/material.dart';
import 'package:prisomtechnology/constant/app_color.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/constant/app_font.dart';
import 'package:prisomtechnology/customs/custom_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/custom_text.dart';
import '../auth_screen/signin_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.green,
        title: CustomText(
          name: "Setting",
          color: AppColor.white,
          fontWeight: AppFont.bold,
          fontSize: AppDimens.size_30,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () async{
            var shared = await SharedPreferences.getInstance();
            shared.clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
          },
          child: CustomBtn(context, 0.08, 0.7, AppColor.green, 30, "Log Out",
              AppColor.yellow, AppFont.bold, AppDimens.size_25),
        ),
      ),
    );
  }
}
