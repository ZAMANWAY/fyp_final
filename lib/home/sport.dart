import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/home/SportsProfile.dart';
import 'package:get/get.dart';

class SportScreeen extends StatefulWidget {
  SportScreeen({Key? key}) : super(key: key);

  @override
  State<SportScreeen> createState() => _SportScreeenState();
}

class _SportScreeenState extends State<SportScreeen> {
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
      //           title: Text("Sport"),
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
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Sport",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
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
                  "Select Sport",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
                20.verticalSpace,
                Wrap(
                  runSpacing: 20.h,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => SportProfileScreen()),
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(image: AssetImage("assets/cricket.jpg"), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => SportProfileScreen()),
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(image: AssetImage("assets/football.jpg"), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => SportProfileScreen()),
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(image: AssetImage("assets/hockey1.jpg"), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
