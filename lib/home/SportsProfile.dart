import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/Signup.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/global/colors.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:fyp/widget.dart/authtxtfield.dart';
import 'package:get/get.dart';

class SportProfileScreen extends StatefulWidget {
  SportProfileScreen({Key? key}) : super(key: key);

  @override
  State<SportProfileScreen> createState() => _SportProfileScreenState();
}

class _SportProfileScreenState extends State<SportProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   width: 0.8.sw,
      //   backgroundColor: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(25.r),
      //       bottomRight: Radius.circular(25.r),
      //     ),
      //   ),
      //   child: SafeArea(
      //     child: ListView(
      //       children: [
      //         50.verticalSpace,
      //         ListTile(
      //           leading: Icon(
      //             Icons.home,
      //             color: Colors.black,
      //           ),
      //           title: Text("Game"),
      //         ),
      //         Divider(
      //           color: Colors.grey,
      //           height: 0,
      //           thickness: 0.5,
      //           endIndent: 80.w,
      //           indent: 10.w,
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.person,
      //             color: Colors.black,
      //           ),
      //           title: Text("Profile"),
      //         ),
      //         Divider(
      //           color: Colors.grey,
      //           height: 0,
      //           thickness: 0.5,
      //           endIndent: 80.w,
      //           indent: 10.w,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Setup Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                20.verticalSpace,
                Text(
                  "Create Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
                20.verticalSpace,
                TextFormField(
                  scrollPadding: EdgeInsets.only(bottom: 200),
                  cursorColor: kprimary,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    fillColor: Colors.black.withOpacity(0.3),
                    filled: true,
                    hintText: "karachi",
                    labelText: "City",
                    labelStyle: TextStyle(color: kprimary, fontSize: 12),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  scrollPadding: EdgeInsets.only(bottom: 200),
                  cursorColor: kprimary,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    fillColor: Colors.black.withOpacity(0.3),
                    filled: true,
                    hintText: "Will Smith",
                    labelText: "Role",
                    labelStyle: TextStyle(color: kprimary, fontSize: 12),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  scrollPadding: EdgeInsets.only(bottom: 200),
                  cursorColor: kprimary,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    fillColor: Colors.black.withOpacity(0.3),
                    filled: true,
                    hintText: "Will Smith",
                    labelText: "Alias",
                    labelStyle: TextStyle(color: kprimary, fontSize: 12),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  scrollPadding: EdgeInsets.only(bottom: 200),
                  cursorColor: kprimary,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: kprimary),
                    ),
                    fillColor: Colors.black.withOpacity(0.3),
                    filled: true,
                    hintText: "Will Smith",
                    labelText: "Gender",
                    labelStyle: TextStyle(color: kprimary, fontSize: 12),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                ),
                10.verticalSpace,
                // TextFormField(
                //   scrollPadding: EdgeInsets.only(bottom: 200),
                //   cursorColor: kprimary,
                //   decoration: InputDecoration(
                //     isDense: true,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.r),
                //       borderSide: BorderSide(color: kprimary),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.r),
                //       borderSide: BorderSide(color: kprimary),
                //     ),
                //     disabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.r),
                //       borderSide: BorderSide(color: kprimary),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.r),
                //       borderSide: BorderSide(color: kprimary),
                //     ),
                //     fillColor: Colors.black.withOpacity(0.3),
                //     filled: true,
                //     hintText: "Will Smith",
                //     labelText: "Role",
                //     labelStyle: TextStyle(color: kprimary, fontSize: 12),
                //     floatingLabelAlignment: FloatingLabelAlignment.start,
                //   ),
                // ),
                //
                // Wrap(
                //   runSpacing: 20.h,
                //   children: [
                //     Container(
                //       height: 200,
                //       width: 300,
                //       decoration: BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 5,
                //             blurRadius: 7,
                //             offset: Offset(0, 3), // changes position of shadow
                //           ),
                //         ],
                //         image: DecorationImage(
                //             image: AssetImage("assets/csgo.jpg"),
                //             fit: BoxFit.fill),
                //         borderRadius: BorderRadius.circular(10.r),
                //       ),
                //     ),
                //     Container(
                //       height: 200,
                //       width: 300,
                //       decoration: BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 5,
                //             blurRadius: 7,
                //             offset: Offset(0, 3), // changes position of shadow
                //           ),
                //         ],
                //         image: DecorationImage(
                //             image: AssetImage("assets/dota2.jpg"),
                //             fit: BoxFit.fill),
                //         borderRadius: BorderRadius.circular(10.r),
                //       ),
                //     ),
                //     Container(
                //       height: 200,
                //       width: 300,
                //       decoration: BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 5,
                //             blurRadius: 7,
                //             offset: Offset(0, 3), // changes position of shadow
                //           ),
                //         ],
                //         image: DecorationImage(
                //             image: AssetImage("assets/pubg.jpg"),
                //             fit: BoxFit.fill),
                //         borderRadius: BorderRadius.circular(10.r),
                //       ),
                //     ),
                //   ],
                // ),

                20.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
