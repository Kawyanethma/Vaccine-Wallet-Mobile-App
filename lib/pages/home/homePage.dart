import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsd/main.dart';
import 'package:gpsd/utils/homeButtons.dart';
import 'package:gpsd/utils/homeButtonsV2.dart';
import 'package:gpsd/utils/user_preferences.dart';

import 'children.dart';
import 'maps.dart';
import 'nextVaccine.dart';
import 'qrcode.dart';
import 'vaccineHistory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
                onPressed: () {
                  showLogout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 30,
                )),
          )
        ],
        backgroundColor: Colors.grey[300],
        titleSpacing: 25,
        title: const Text(
          'My Card',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
          child: Column(children: [
            const SizedBox(height: 15),
            //card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: 350,
                height: 200,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 55, 55, 55),
                      Color.fromARGB(255, 26, 109, 161),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('lib/icons/Slgov.png', height: 50),
                      const Text(
                        'Vaccine Card',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                  const Text('', style: TextStyle(fontSize: 20)),
                  Text('${user.name}',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  const Text('Age : 22',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  const Text('', style: TextStyle(fontSize: 22)),
                  Row(
                    children: const [
                      Text('Next Vaccine : ',
                          style: TextStyle(color: Colors.white)),
                      Text('09/22', style: TextStyle(color: Colors.white)),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                homebuttonsV2(
                  iconImagePath: 'lib/icons/children.png',
                  buttonText: 'Children',
                  page: ChildrenPage(),
                ),
                homebuttonsV2(
                  iconImagePath: 'lib/icons/qr.png',
                  buttonText: 'QR Code',
                  page: QRPage(),
                ),
                homebuttonsV2(
                  iconImagePath: 'lib/icons/map.png',
                  buttonText: 'Map',
                  page: MapsPage(),
                ),
              ],
            ),
            const SizedBox(
              height: 27,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(children: const [
                  Homebuttons(
                    iconImagePath1: 'lib/icons/vaccination.png',
                    buttonText: 'Vaccine Histroy',
                    page: VaccineHistroy(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Homebuttons(
                    iconImagePath1: 'lib/icons/vaccine.png',
                    buttonText: 'Next Vaccines',
                    page: NextVaccine(),
                  ),
                ])),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }

  //methods

  Future showLogout(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                  title: Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 20)),
                  actions: [
                    CupertinoActionSheetAction(
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => setState(() {
                              User userLocal = UserPreferences.getUser();
                              userLocal = userLocal.copy(loginState: false);
                              UserPreferences.setUser(userLocal);
                              print(userLocal.loginState);
                            })),
                    CupertinoActionSheetAction(
                        child: Text('Cancel',
                            style: TextStyle(color: Colors.blue)),
                        onPressed: () => Navigator.pop(context, true)),
                  ]));
    } else {
      return showModalBottomSheet(
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          builder: (context) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Are you sure you want to logout?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 4,
                          vertical: 5),
                      child: MaterialButton(
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color.fromARGB(255, 189, 21, 21),
                        onPressed: (() {
                          User userLocal = UserPreferences.getUser();
                          setState(() {
                            userLocal = userLocal.copy(loginState: false);
                            UserPreferences.setUser(userLocal);
                            print(userLocal.loginState);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          });
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 4,
                          vertical: 5),
                      child: MaterialButton(
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color.fromARGB(255, 20, 115, 174),
                        onPressed: (() {
                          Navigator.pop(context, true);
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
    }
  }
}
