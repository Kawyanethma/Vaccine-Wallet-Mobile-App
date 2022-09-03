import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gpsd/utils/children_preferences.dart';
import 'package:gpsd/utils/firebase_user_preferences.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({Key? key}) : super(key: key);
  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  final user = firebaseUserPreferences.getfirebaseUser();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context, true),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }),
          ),
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Children',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 300, // change to get device height
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: StreamBuilder<List<Children>>(
                  stream: readChildren(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('data error ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final childrenData = snapshot.data!;
                      return ListView(
                        children: childrenData.map(buildChildren).toList(),
                      );
                    } else {
                      print(' ');
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Stream<List<Children>> readChildren() => FirebaseFirestore.instance
      .collection('users')
      .doc(user.id)
      .collection('children')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Children.fromJson(doc.data())).toList());

  Widget buildChildren(Children children) => ListTile(
        leading: CircleAvatar(child: Text('${children.age}')),
        title: Text(children.name),
        subtitle: Text(children.id.toString()),
      );

  void showTextSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Row(
        children: [
          Text(
            text + '  \t',
            style: TextStyle(fontSize: 16),
          ),
          Icon(
            Icons.done,
            color: Colors.white,
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
