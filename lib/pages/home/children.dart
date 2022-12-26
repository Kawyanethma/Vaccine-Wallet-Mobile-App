import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gpsd/pages/home/noChildren.dart';
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
              SizedBox(
                height: 70,
              ),
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                child: StreamBuilder<List<Children>>(
                  stream: readChildren(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Database error :('));
                    } else if (snapshot.hasData) {
                      print(snapshot.connectionState);
                      print(user.id);
                      print(snapshot.hasData);
                      final childrenData = snapshot.requireData;
                      if (snapshot.requireData.isEmpty) return NoChildren();
                      print(childrenData);
                      return ListView(
                        children: childrenData.map(buildChildren).toList(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Center(child: Text('Somting went wrong'));
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

  Widget buildChildren(Children children) => Column(
        children: [
          InkWell(
              onTap: () {},
              customBorder: StadiumBorder(),
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-6, -6),
                        color: Colors.white,
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        offset: Offset(6, 6),
                        color: Color(0xFFA7A9AF),
                        blurRadius: 10,
                      ),
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('lib/icons/girl.png'),
                    ),
                    title: Text(
                      children.name,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(221, 23, 59, 170),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Child ID: ' + children.id.toString()),
                          Text('Age: ' + children.age.toString())
                        ]),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          )
        ],
      );
}
