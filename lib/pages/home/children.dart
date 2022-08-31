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
        body: StreamBuilder<List<Children>>(
          stream: readChildren(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('data error ${snapshot.error}'));
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
}
