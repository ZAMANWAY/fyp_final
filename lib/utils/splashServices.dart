import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Auth/PreLogin.dart';
import 'package:fyp/home/home.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreeen())));
    } else {
      Timer(const Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => PreLoginScreen())));
    }
  }
}
