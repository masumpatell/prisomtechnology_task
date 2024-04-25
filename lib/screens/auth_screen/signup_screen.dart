import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prisomtechnology/customs/custom_btn.dart';
import 'package:prisomtechnology/customs/custom_text.dart';
import 'package:prisomtechnology/screens/auth_screen/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/app_color.dart';
import '../../constant/app_dimens.dart';
import '../../constant/app_font.dart';
import '../../customs/custom_textfield.dart';
import '../../firebaseData/authfirebase/emailFirebase/signup_firebase.dart';
import '../../firebaseData/authfirebase/googlefirebase/googleFirebase.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailUp = TextEditingController();
  final TextEditingController passwordUp = TextEditingController();
  final TextEditingController phoneNumberUp = TextEditingController();

  // String? emailSharedUp;
  // String? passwordSharedUp;
  //
  // Future storeShared() async{
  //   var shared = await SharedPreferences.getInstance();
  //   emailSharedUp = shared.getString("email");
  //   passwordSharedUp = shared.getString("password");
  // }
  //
  // @override
  // void initState() {
  //   storeShared();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomText(
                name: "Create Account",
                color: AppColor.white,
                fontSize: AppDimens.size_50,
                fontWeight: AppFont.regular,
                fontFamily: "masum",
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              SvgPicture.asset(
                "assets/images/images1.svg",
                height: AppDimens.size_200,
              ),
              const SizedBox(
                height: AppDimens.size_15,
              ),
              CustomTextField(
                keyType: TextInputType.emailAddress,
                name: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                controller: emailUp,
                hintText: "Enter Your Email",
                hideText: false,
              ),
              const SizedBox(
                height: AppDimens.size_15,
              ),
              CustomTextField(
                keyType: TextInputType.number,
                name: "Phone No",
                prefixIcon: const Icon(Icons.phone_android),
                controller: phoneNumberUp,
                hintText: "Enter Your Phone Number",
                hideText: false,
              ),
              const SizedBox(
                height: AppDimens.size_15,
              ),
              CustomTextField(
                keyType: TextInputType.text,
                name: "Passwords",
                prefixIcon: const Icon(Icons.lock_open),
                controller: passwordUp,
                hintText: "Enter Your Password",
                hideText: true,
              ),
              const SizedBox(
                height: AppDimens.size_30,
              ),
              InkWell(
                onTap: () async{
                  SignUpFireBase(context, emailUp.text, passwordUp.text);
                  var shared = await SharedPreferences.getInstance();
                  shared.setString("email", emailUp.text);
                  shared.setString("password", passwordUp.text);
                  shared.setString("phone", phoneNumberUp.text);
                },
                child: CustomBtn(context, 0.07, 0.9, AppColor.yellow, 20, "Create Account",
                    AppColor.green, AppFont.bold, AppDimens.size_25),
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      signInWithGoogle(context);
                    },
                    child: Icon(
                      EvaIcons.google,
                      color: AppColor.white,
                      size: AppDimens.size_40,
                    ),
                  ),
                  CustomText(
                    name: "Google",
                    color: AppColor.white,
                    fontWeight: AppFont.bold,
                  )
                ],
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    name: "Already Have An Account ! ",
                    color: AppColor.white,
                    fontSize: AppDimens.size_15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: CustomText(
                      name: "Login",
                      color: AppColor.yellow,
                      fontWeight: AppFont.bold,
                      fontSize: AppDimens.size_15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
