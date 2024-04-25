import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prisomtechnology/constant/app_dimens.dart';
import 'package:prisomtechnology/customs/custom_btn.dart';
import 'package:prisomtechnology/firebaseData/authfirebase/emailFirebase/signup_firebase.dart';
import 'package:prisomtechnology/screens/auth_screen/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/app_color.dart';
import '../../constant/app_font.dart';
import '../../customs/custom_text.dart';
import '../../customs/custom_textfield.dart';
import '../../firebaseData/authfirebase/emailFirebase/signin_firebase.dart';
import '../../firebaseData/authfirebase/googlefirebase/googleFirebase.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailIn = TextEditingController();
  final TextEditingController passwordIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //Welcome
              CustomText(
                name: "Welcome",
                color: AppColor.white,
                fontSize: AppDimens.size_50,
                fontWeight: AppFont.regular,
                fontFamily: "masum",
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              //images
              SvgPicture.asset(
                "assets/images/images1.svg",
                height: AppDimens.size_200,
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              //Email
              CustomTextField(
                keyType: TextInputType.emailAddress,
                name: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                controller: emailIn,
                hintText: "Enter Your Email",
                hideText: false,
              ),
              const SizedBox(
                height: AppDimens.size_50,
              ),
              //Password
              CustomTextField(
                keyType: TextInputType.text,
                name: "Passwords",
                prefixIcon: const Icon(Icons.lock_open),
                controller: passwordIn,
                hintText: "Enter Your Password",
                hideText: true,
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              //Forget Password
              Container(
                  margin: const EdgeInsets.only(right: AppDimens.size_20),
                  alignment: Alignment.bottomRight,
                  width: MediaQuery.of(context).size.width,
                  child: CustomText(
                    name: "Forget Password ? ",
                    color: AppColor.yellow,
                  )),
              const SizedBox(
                height: AppDimens.size_40,
              ),
              //BTN
              InkWell(
                onTap: () async{
                  SignInFireBase(context, emailIn.text, passwordIn.text);
                  var shared = await SharedPreferences.getInstance();
                  shared.setString("email", emailIn.text);
                  shared.setString("pass", passwordIn.text);
                },
                child: CustomBtn(context, 0.07, 0.9, AppColor.yellow, 20, "Login",
                    AppColor.green, AppFont.bold, AppDimens.size_25),
              ),
              const SizedBox(
                height: AppDimens.size_20,
              ),
              //Google
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
                    name: "Don't have an account ? ",
                    color: AppColor.white,
                    fontSize: AppDimens.size_15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: CustomText(
                      name: "Sign up",
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
