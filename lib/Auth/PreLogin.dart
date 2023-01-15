import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/home/home.dart';
import 'package:fyp/utils/splashServices.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  String? path;
  // final Widget svg = SvgPicture.asset(path.toString());
  // googleLogin() async {
  //   print("googleLogin method Called");

  //   final _googleSignIn = GoogleSignIn(serverClientId: "294164451918-trjj5uibfbp9d4psfv7e8qja3k6dbbnm.apps.googleusercontent.com");
  //   // var result = await _googleSignIn.signIn();
  //   // print("shariq" + result!.toString());
  //   // print(result.displayName.toString());
  //   // print(result.email.toString());
  //   try {
  //     var result = await _googleSignIn.signIn();

  //     print("shariq" + result!.toString());
  //     print(result.displayName.toString());
  //     print(result.displayName.toString());
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  Future<void> signinWithGoogle() async {
    const GOOGLE_CLIENT_DEV_KEY = '294164451918-trjj5uibfbp9d4psfv7e8qja3k6dbbnm.apps.googleusercontent.com';
    final GoogleSignIn _googleSignIn = new GoogleSignIn(
      serverClientId: GOOGLE_CLIENT_DEV_KEY,
      scopes: [],
    );
    try {
      final googleUserAccount = await _googleSignIn.signIn();
      final googleAuth = await googleUserAccount?.authentication;
      if (googleAuth != null) {
        print(googleAuth.idToken);
        print("Access Token : " + googleAuth.accessToken.toString());
        print(googleUserAccount!.displayName);
        print(googleUserAccount.email);
        print(googleUserAccount.photoUrl);
        Get.to(() => HomeScreeen());
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage(
          //     "assets/MicrosoftTeams-image (1).png",
          //   ),
          // ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.5.sh),
                  Text(
                    'Pre Login',
                    style: TextStyle(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Select your login option',
                    style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  btn(
                    width: 335,
                    ButtonText: "Login with ID",
                    height: 58.h,
                    tap: () {
                      Get.to(() => LoginScreeen());
                    },
                  ),
                  SizedBox(height: 4.h),
                  btn(
                    width: 335,
                    ButtonText: "Login with Facebook",
                    height: 58.h,
                    tap: () {
                      Get.to(() => LoginScreeen());
                    },
                  ),
                  SizedBox(height: 4.h),
                  btn(
                    width: 335,
                    ButtonText: "Login with Google",
                    height: 58.h,
                    tap: () {
                      signinWithGoogle();
                      // Get.to(() => HomeScreeen());
                    },
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
        ));
  }
}
