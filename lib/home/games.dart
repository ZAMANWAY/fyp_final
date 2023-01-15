import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/home/profile.dart';
import 'package:get/get.dart';

class GameScreeen extends StatefulWidget {
  GameScreeen({Key? key}) : super(key: key);

  @override
  State<GameScreeen> createState() => _GameScreeenState();
}

class _GameScreeenState extends State<GameScreeen> {
  final games = FirebaseFirestore.instance.collection('categories').doc().collection('cs').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Game",
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
            stream: games,
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
                        Text(data['game_image'].toString()),
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

      // Container(
      //   width: double.infinity,
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w),
      //       child: Column(
      //         children: [
      //           20.verticalSpace,
      //           Text(
      //             "Select Game",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 18.sp,
      //             ),
      //           ),
      //           20.verticalSpace,
      //           StreamBuilder<QuerySnapshot>(
      //             stream: games,
      //             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //               if (snapshot.hasError) {
      //                 return Text('Something went wrong');
      //               }

      //               if (snapshot.connectionState == ConnectionState.waiting) {
      //                 return Text("Loading");
      //               }

      //               return Expanded(
      //                 child: ListView(
      //                   children: snapshot.data!.docs.map((DocumentSnapshot document) {
      //                     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      //                     return Column(
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () {
      //                             Get.to(() => GameScreeen());
      //                           },
      //                           child: Container(
      //                             height: 200,
      //                             width: 300,
      //                             decoration: BoxDecoration(
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                   color: Colors.grey.withOpacity(0.5),
      //                                   spreadRadius: 5,
      //                                   blurRadius: 7,
      //                                   offset: Offset(0, 3), // changes position of shadow
      //                                 ),
      //                               ],
      //                               image: DecorationImage(image: NetworkImage(data['game_image'].toString()), fit: BoxFit.fill),
      //                               borderRadius: BorderRadius.circular(10.r),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                       ],
      //                     );
      //                   }).toList(),
      //                 ),
      //               );
      //             },
      //           ),
      //           20.verticalSpace
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
