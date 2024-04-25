import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/constant/app_font.dart';
import 'package:prisomtechnology/customs/custom_btn.dart';
import 'package:prisomtechnology/customs/custom_text.dart';
import 'package:prisomtechnology/screens/auth_screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_color.dart';
import '../auth_screen/signin_screen.dart';
import '../bottom_bar/bottom_bar.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? emailShared;
  String? passwordShared;

  getSharedData() async {
    var shared = await SharedPreferences.getInstance();
    emailShared = shared.getString("email");
    passwordShared = shared.getString("password");

    if ((emailShared != null && emailShared!.isNotEmpty) ||
        (passwordShared != null && passwordShared!.isNotEmpty)) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.green,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor.yellow,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppDimens.size_600))),
            ),
            const SizedBox(
              height: AppDimens.size_100,
            ),
            CustomText(
              name: "Welcome",
              color: AppColor.yellow,
              fontSize: AppDimens.size_70,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              name: "Are You Ready To Take Off ?",
              color: AppColor.yellow,
              fontSize: AppDimens.size_20,
            ),
            const SizedBox(
              height: AppDimens.size_50,
            ),
            Image.asset("assets/images/welcome-back.png",height: AppDimens.size_150,),
          ],
        ));
  }
}
