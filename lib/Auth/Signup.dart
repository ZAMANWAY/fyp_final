import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/global/constanst.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:fyp/widget.dart/authtxtfield.dart';
import 'package:get/get.dart';

class SignUpScreeen extends StatefulWidget {
  SignUpScreeen({Key? key}) : super(key: key);

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users');
  bool isLoading = false;

  void signUp() {
    setState(() {
      isLoading = true;
    });

    // _auth
    //     .sendSignInLinkToEmail(
    //       email: emailController.text.toString(),
    //       actionCodeSettings: ActionCodeSettings(
    //         url: 'https://matchformatch.page.link/',
    //         handleCodeInApp: true,
    //         iOSBundleId: 'com.example.fyp',
    //         androidPackageName: 'com.example.fyp',
    //         androidMinimumVersion: "1",
    //       ),
    //     )
    //     .then((value) {})
    //     .onError((error, stackTrace) {
    //   print(error.toString());
    // });

    _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString()).then((value) {
      Utils.flushBarSuccessMessage('User register successfully', context);
      User? user = FirebaseAuth.instance.currentUser;
      fireStore.doc(user!.uid).set({
        'name': nameController.text.toString(), // John Doe
        'email': emailController.text.toString(), // Stokes and Sons
        'password': passController.text.toString(),
        'id': user.uid,
        "palyer_registed": "no"
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreeen()));
      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      Utils.toastMessage(error.toString());
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
          "SignUp",
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
                        "Signup",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      20.verticalSpace,
                      AuthTextField(
                        controller: nameController,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        underlineColor: Colors.blue,
                        labelColor: Colors.grey,
                        hintColor: Colors.grey,
                        widthh: 0.8.sw,
                        isPassword: false,
                        labelText: "Name",
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
                      SizedBox(height: 20.h),
                      AuthTextField(
                        controller: confirmpassController,
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        underlineColor: Colors.blue,
                        labelColor: Colors.grey,
                        hintColor: Colors.grey,
                        widthh: 0.8.sw,
                        isPassword: true,
                        labelText: "Confirm password",
                      ),
                      20.verticalSpace,
                      btn(
                        width: 300,
                        ButtonText: "Signup",
                        tap: () {
                          signUp();
                        },
                      ),
                      20.verticalSpace,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {},
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
                                  text: 'Already have an account?',
                                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                                ),
                                TextSpan(
                                  text: ' Login',
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
