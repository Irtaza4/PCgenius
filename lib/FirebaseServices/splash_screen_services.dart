import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pc_genius/ui/screens/home_screen.dart';
import 'package:pc_genius/ui/screens/login_screen.dart';
import 'dart:async';

class SplashScreenServices {
  void isLogin(BuildContext context, AnimationController controller) {
    final _auth = FirebaseAuth.instance;
    final user =_auth.currentUser;
    controller.forward();

    if(user!=null){
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }

  }
}
