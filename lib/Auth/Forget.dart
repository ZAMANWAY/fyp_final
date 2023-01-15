import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/Signup.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:fyp/widget.dart/authtxtfield.dart';
import 'package:get/get.dart';

class ForgetScreeen extends StatefulWidget {
  ForgetScreeen({Key? key}) : super(key: key);

  @override
  State<ForgetScreeen> createState() => _ForgetScreeenState();
}

class _ForgetScreeenState extends State<ForgetScreeen> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                'assets/Match For MAtch.png',
                scale: 3,
              )),
              20.verticalSpace,
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              20.verticalSpace,
              AuthTextField(
                controller: emailController,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                underlineColor: Colors.blue,
                labelColor: Colors.grey,
                hintColor: Colors.grey,
                widthh: 0.8.sw,
                isPassword: false,
                labelText: "Email",
              ),
              SizedBox(height: 20.h),
              20.verticalSpace,
              btn(
                width: 300,
                ButtonText: "Continue",
                tap: () {
                  auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                    Utils.toastMessage('We have sent you email to recover password, please check email');
                  }).onError((error, stackTrace) {
                    Utils.toastMessage(error.toString());
                  });
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
