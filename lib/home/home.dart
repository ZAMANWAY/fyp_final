import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Auth/login.dart';
import 'package:fyp/global/constanst.dart';
import 'package:fyp/home/games.dart';
import 'package:fyp/home/sport.dart';
import 'package:fyp/home/userScreen.dart';
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
  String? category;
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
                  Get.to(() => UserDetailScreen());
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text("Team members"),
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
      body:

          //  Column(
          //   children: [
          //     SizedBox(
          //       height: 20,
          //     ),
          //     StreamBuilder<QuerySnapshot>(
          //       stream: categories,
          //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //         if (snapshot.hasError) {
          //           return Text('Something went wrong');
          //         }

          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return Text("Loading");
          //         }

          //         return Expanded(
          //           child: ListView(
          //             children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          //               return Column(
          //                 children: [
          //                   Text(data['game_type'].toString()),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                   GestureDetector(
          //                     onTap: () {
          //                       Get.to(() => GameScreeen());
          //                     },
          //                     child: Container(
          //                       height: 200,
          //                       width: 300,
          //                       decoration: BoxDecoration(
          //                         boxShadow: [
          //                           BoxShadow(
          //                             color: Colors.grey.withOpacity(0.5),
          //                             spreadRadius: 5,
          //                             blurRadius: 7,
          //                             offset: Offset(0, 3), // changes position of shadow
          //                           ),
          //                         ],
          //                         image: DecorationImage(image: NetworkImage(data['game_image'].toString()), fit: BoxFit.fill),
          //                         borderRadius: BorderRadius.circular(10.r),
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                 ],
          //               );
          //             }).toList(),
          //           ),
          //         );
          //       },
          //     )
          //   ],
          // ),

          Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            // Container(
            //   margin: EdgeInsets.only(left: 20),
            //   child: Text(
            //     "Available Players",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 14.sp,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 20),
            //   child: Text(
            //     "Select your team members",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 11.sp,
            //     ),
            //   ),
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //         height: 100.h,
            //         decoration: BoxDecoration(color: Color.fromARGB(255, 199, 219, 235), borderRadius: BorderRadius.circular(20)),
            //         child: ListView.builder(
            //             itemCount: usersList.length,
            //             itemBuilder: (context, index) {
            //               return ListTile(
            //                 title: Text(usersList[index]["name"]),
            //                 subtitle: Text(usersList[index]["phone_number"].toString()),
            //                 trailing: IconButton(
            //                   iconSize: 25,
            //                   icon: Icon((selectedUsers.contains('${usersList[index]["name"]}')) ? Icons.check_box : Icons.add),
            //                   onPressed: () => (selectedUsers.contains('${usersList[index]["name"]}')) ? removeUser('${usersList[index]["name"]}') : selectUser('${usersList[index]["name"]}'),
            //                 ),
            //               );
            //             }),
            //       ),
            //     ),
            //     Expanded(
            //         child: (selectedUsers.length > 0)
            //             ? Container(
            //                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //                 height: 100.h,
            //                 decoration: BoxDecoration(color: Color.fromARGB(255, 199, 219, 235), borderRadius: BorderRadius.circular(20)),
            //                 child: ListView.builder(
            //                   itemCount: selectedUsers.length,
            //                   itemBuilder: (context, index) => ListTile(
            //                     title: Text(' ${selectedUsers[index]}'),
            //                     trailing: IconButton(
            //                       iconSize: 30,
            //                       icon: Icon(Icons.delete),
            //                       onPressed: () => removeUser(' ${selectedUsers[index]}'),
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             : Center(child: Text('No users selected!')))
            //   ],
            // ),
            Center(
              child: Column(
                children: [
                  10.verticalSpace,
                  Text(
                    "Select Category",
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
                        onTap: () {
                          category = 'physical';
                          Get.to(() => GameScreeen(
                                category: category.toString(),
                              ));
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
                            image: DecorationImage(image: AssetImage("assets/5272450.jpg"), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          category = 'virtual';
                          Get.to(() => SportScreeen(category: category.toString()));
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
                            image: DecorationImage(image: AssetImage("assets/sport.jpg"), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
