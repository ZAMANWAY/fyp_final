import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/global/constanst.dart';
import 'package:fyp/home/games.dart';
import 'package:fyp/home/sport.dart';
import 'package:fyp/utils/utils.dart';
import 'package:get/get.dart';

class HomeScreeen extends StatefulWidget {
  HomeScreeen({Key? key}) : super(key: key);

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  final auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot? snapshot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadUserData();
  }

  final CollectionReference firestoreInstance = FirebaseFirestore.instance.collection('users');
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();

  final categories = FirebaseFirestore.instance.collection('categories').snapshots();

  void _loadUserData() async {
    await firestoreInstance.doc(user!.uid).get().then((event) {
      // you can access the values by
      print(event['name']);
      print(event['email']);
      setState(() {
        name = event['name'];
        email = event['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 0.8.sw,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              50.verticalSpace,
              Text(name.toString()),
              Text(email.toString()),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text("Home"),
              ),
              Divider(
                color: Colors.grey,
                height: 0,
                thickness: 0.5,
                endIndent: 80.w,
                indent: 10.w,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text("Profile"),
              ),
              Divider(
                color: Colors.grey,
                height: 0,
                thickness: 0.5,
                endIndent: 80.w,
                indent: 10.w,
              ),
              ListTile(
                onTap: () {
                  auth.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreeen()));
                  }).onError((error, stackTrace) {
                    Utils.toastMessage(error.toString());
                  });
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: categories,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        Text(data['game_type'].toString()),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => GameScreeen());
                          },
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
                              image: DecorationImage(image: NetworkImage(data['game_image'].toString()), fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          )
        ],
      ),

      //  Container(
      //   width: double.infinity,
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w),
      //     child: Column(
      //       children: [
      //         20.verticalSpace,
      //         Text(
      //           "Select Category",
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 18.sp,
      //           ),
      //         ),
      //         20.verticalSpace,
      //         Wrap(
      //           runSpacing: 20.h,
      //           children: [
      //             GestureDetector(
      //               onTap: () {
      //                 Get.to(() => GameScreeen());
      //               },
      //               child: Container(
      //                 height: 200,
      //                 width: 300,
      //                 decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.grey.withOpacity(0.5),
      //                       spreadRadius: 5,
      //                       blurRadius: 7,
      //                       offset: Offset(0, 3), // changes position of shadow
      //                     ),
      //                   ],
      //                   image: DecorationImage(image: AssetImage("assets/5272450.jpg"), fit: BoxFit.fill),
      //                   borderRadius: BorderRadius.circular(10.r),
      //                 ),
      //               ),
      //             ),
      //             GestureDetector(
      //               onTap: () {
      //                 Get.to(() => SportScreeen());
      //               },
      //               child: Container(
      //                 height: 200,
      //                 width: 300,
      //                 decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.grey.withOpacity(0.5),
      //                       spreadRadius: 5,
      //                       blurRadius: 7,
      //                       offset: Offset(0, 3), // changes position of shadow
      //                     ),
      //                   ],
      //                   image: DecorationImage(image: AssetImage("assets/sport.jpg"), fit: BoxFit.fill),
      //                   borderRadius: BorderRadius.circular(10.r),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
