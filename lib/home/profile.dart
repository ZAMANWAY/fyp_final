import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/global/colors.dart';
import 'package:fyp/home/home.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/widget.dart/CustomButton.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  String? gameId;
  String? gameName;
  String? gameImage;

  ProfileScreen({Key? key, this.gameId, this.gameName, this.gameImage}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var dropdownValue;
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController stremIDController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aliasController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  Future<void> saveData(
    String stremId,
    role,
    alias,
    gender,
  ) async {
    FirebaseFirestore.instance.collection('users').doc(user!.uid).update(
      {
        'stremId': stremId,
        "role": role,
        "alias": alias,
        "gender": gender,
        "palyer_registed": "yes",
        "gameId": widget.gameId,
        "gameImage": widget.gameImage,
        "game_name": widget.gameName,
      },
    ).then((value) {
      Utils.flushBarSuccessMessage("profile created successfully", context);
      Get.to(() => HomeScreeen());
    });
  }

// update firestore document field
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
// get data from documnet id firestore
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
                  controller: stremIDController,
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
                    labelText: "Steam ID",
                    labelStyle: TextStyle(color: kprimary, fontSize: 12),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                ),
                10.verticalSpace,
                TextFormField(
                  controller: roleController,
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
                  controller: aliasController,
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
                  controller: genderController,
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
// make textfield null
                20.verticalSpace,
                btn(
                  width: 335,
                  ButtonText: "Save",
                  height: 58.h,
                  tap: () {
                    saveData(stremIDController.text.toString(), roleController.text.toString(), aliasController.text.toString(), genderController.text.toString());
                    stremIDController.clear();
                    roleController.clear();
                    aliasController.clear();
                    genderController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
