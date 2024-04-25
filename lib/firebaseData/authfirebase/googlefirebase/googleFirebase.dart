import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../customs/dialogbox.dart';
import '../../../screens/bottom_bar/bottom_bar.dart';
import '../../../screens/home/home_screen.dart';

Future<GoogleSignInAccount?> signInWithGoogle(context) async{
  print("call");
  try{
    GoogleSignInAccount? userGoogle;
    userGoogle = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth;
    googleAuth = await userGoogle?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const BottomBar()));

    return userGoogle;
  }
  on FirebaseAuthException catch(e){
    if(e.code == "account-exists-with-different-credential"){
      DialogBox(context, "Account Already Exit in Other Device");
    }
    else if(e.code == "operation-not-allowed"){
      DialogBox(context, "This Google Account Unavailable For This App");
    }
    else if(e.code == "user-not-found"){
      DialogBox(context, "User Not Found");
    }
    else{
      DialogBox(context, e.toString());
      print(e.toString());
    }
  }
}