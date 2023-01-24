import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    getFilteredUsers();
  }

  List<String> selectedUsers = [];

  void selectUser(String user, phone) {
    if (selectedUsers.length < 5) {
      setState(() {
        // selectedUsers.add(user);
        selectedUsers.add(user);
      });
    } else {
      showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('You can only select 5 users!')));
    }
  }

  void removeUser(String user) {
    setState(() {
      selectedUsers.removeWhere((item) => item == user);
    });
  }

  List<Map<String, dynamic>> usersList = [];

  void getFilteredUsers() async {
    CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot = await usersRef.where('palyer_registed', isEqualTo: "yes").get();

    querySnapshot.docs.forEach((doc) => usersList.add(doc.data()! as Map<String, dynamic>));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Column(
        children: [
          Container(
            width: 1.sw,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Available Players",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Select your team members",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            height: 0.7.sh,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 199, 219, 235), borderRadius: BorderRadius.circular(20)),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: usersList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {},
                                    title: Text(usersList[index]["name"]),
                                    subtitle: Text(usersList[index]["phone_number"].toString()),
                                    trailing: IconButton(
                                      iconSize: 25,
                                      icon: Icon((selectedUsers.contains('${usersList[index]["name"]}')) ? Icons.check_box : Icons.add),
                                      onPressed: () => (selectedUsers.contains('${usersList[index]["name"]}'))
                                          ? removeUser('${usersList[index]["name"]}')
                                          : selectUser('${usersList[index]["name"]}', '${usersList[index]["phone_number"]}'),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: (selectedUsers.length > 0)
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    height: 0.7.sh,
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 199, 219, 235), borderRadius: BorderRadius.circular(20)),
                                    child: ListView.builder(
                                      itemCount: selectedUsers.length,
                                      itemBuilder: (context, index) => ListTile(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    content: SingleChildScrollView(
                                                      child: Column(
                                                        children: [Text("${selectedUsers[index]}")],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        title: Text(' ${selectedUsers[index]}'),
                                        trailing: IconButton(
                                          iconSize: 30,
                                          icon: Icon(Icons.delete),
                                          onPressed: () => removeUser(' ${selectedUsers[index]}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Center(child: Text('No users selected!')))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
