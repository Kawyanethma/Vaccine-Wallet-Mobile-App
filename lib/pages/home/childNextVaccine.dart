import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gpsd/utils/firebase_user_preferences.dart';

class ChildNextVaccine extends StatefulWidget {
  final String childName;
  final String childGender;
  final String childId;
  const ChildNextVaccine({
    Key? key,
    required this.childName,
    required this.childGender,
    required this.childId,
  }) : super(key: key);
  @override
  State<ChildNextVaccine> createState() => _ChildNextVaccineState();
}

class _ChildNextVaccineState extends State<ChildNextVaccine> {
  final user = firebaseUserPreferences.getfirebaseUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              );
            }),
          ),
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    widget.childGender.toString().contains('female')
                        ? AssetImage('lib/icons/girl.png')
                        : AssetImage('lib/icons/boy.png'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.childName,
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(221, 23, 59, 170),
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Next Vaccine',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(221, 23, 59, 170),
                        fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.id)
                        .collection('children')
                        .doc(widget.childId)
                        .collection('vaccines')
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs
                          .where((QueryDocumentSnapshot<Object?> element) =>
                              element['status'].toString().contains('not yet'))
                          .isEmpty) {
                        return Center(child: Text('No data'));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            if (data['status']
                                .toString()
                                .startsWith('not yet')) {
                              return ListTile(
                                title: Text('Name: ' + data['name']),
                                subtitle: Text('Status: ' + data['status']),
                                leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('lib/icons/vaccinated.png')),
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      }
                    }),
                  )),
            ]),
          ),
        ));
  }
}
