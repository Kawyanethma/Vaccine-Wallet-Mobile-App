import 'package:flutter/material.dart';

import 'HomeButtons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
                padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
             child: Column(children :[ 
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 80.0),
                    child: Text(
                      'Account',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            Column(
                  children: const [
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.0,)),
                  CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/icons/user1.png'),
                  backgroundColor: Colors.lightGreen,
                ),
                SizedBox(
                    height: 20,
                  ),
                  Text('Kawyanethma',
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                        )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('ID Number: 200016903099',
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                        )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Email: Kawyanethma@gmail.com',
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                        )),
                ],),
            const SizedBox(
                    height: 50,
            ),
            Column(children: const [
                  Homebuttons(
                      iconImagePath1: 'lib/icons/email.png',
                      buttonText: 'Change Email'),
                  SizedBox(
                    height: 30,
                  ),
                  Homebuttons(
                      iconImagePath1: 'lib/icons/password.png',
                      buttonText: 'Change Password'),
                  SizedBox(
                    height: 30,
                  ),
                 
                ]),
             ])
          ),
        )
        );
  }
}