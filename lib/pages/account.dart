import 'package:flutter/material.dart';
import 'package:gpsd/pages/qrcode.dart';
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(children: [
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
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 1.0,
                    )),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('lib/icons/user.png'),
                        backgroundColor: Colors.lightGreen,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Kawyanethma',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text('ID Number: 200016903099',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text('Email: Kawyanethma@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(children:  [
                  Homebuttons(
                      iconImagePath1: 'lib/icons/email.png',
                      buttonText: 'Change Email',
                      page: const QRPage(),),
                  const SizedBox(
                    height: 25,
                  ),
                  Homebuttons(
                       iconImagePath1: 'lib/icons/password.png',
                      buttonText: 'Change Password',
                      page: const QRPage(),),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ])),
        ));
  }
}
