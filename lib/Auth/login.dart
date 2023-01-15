import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/Forget.dart';
import 'package:fyp/Auth/Signup.dart';
import 'package:fyp/home/home.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:fyp/widget.dart/authtxtfield.dart';
import 'package:get/get.dart';

class LoginScreeen extends StatefulWidget {
  LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;
  final _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      isLoading = true;
    });
    _auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text.toString()).then((value) {
      Utils.toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreeen()));
      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils.toastMessage(error.toString());
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: isLoading == true
          ? Utils.spinkit
          : Container(
              width: double.infinity,
              child: SingleChildScrollView(
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
                        "LOGIN",
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
                      AuthTextField(
                        controller: passController,
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        underlineColor: Colors.blue,
                        labelColor: Colors.grey,
                        hintColor: Colors.grey,
                        widthh: 0.8.sw,
                        isPassword: true,
                        labelText: "Password",
                      ),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgetScreeen());
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w600, color: Colors.black, fontSize: 15.sp),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      btn(
                        width: 300,
                        ButtonText: "Login",
                        tap: () {
                          login();
                        },
                      ),
                      20.verticalSpace,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpScreeen());
                          },
                          child: RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Dont have an account?',
                                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                                ),
                                TextSpan(
                                  text: ' Signup',
                                  style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 17.sp, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
