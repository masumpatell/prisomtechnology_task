import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prisomtechnology/screens/home/home_screen.dart';

import '../../../customs/dialogbox.dart';
import '../../../screens/bottom_bar/bottom_bar.dart';

SignUpFireBase(context,String emailUp,String passwordUp) async{
  print("=========================================");
  print(emailUp.toString());
  print(passwordUp.toString());
  print("=========================================");
  if (emailUp.isEmpty || passwordUp.isEmpty) {
    DialogBox(context, "Please Enter Email or Password");
  } else {
    UserCredential? user;
    try{
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailUp, password: passwordUp)
          .then((value) => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomBar())));
      print("done");
    }
    on FirebaseAuthException catch(e){
      if( e.code == "email-already-in-use"){
        DialogBox(context, "EmailId Already Exits");
      }
      else if( e.code == "invalid-email"){
        DialogBox(context, "Enter Valid Id");
      }
      else if(e.code == "weak-password"){
        DialogBox(context, "Password be at least 6 Characters");
      }
      else{
        DialogBox(context, e.toString());
      }
    }
  }
}