import 'package:flutter/material.dart';
import 'package:gpsd/pages/children.dart';
import 'package:gpsd/pages/homeButtons.dart';
import 'package:gpsd/pages/homeButtonsV2.dart';
import 'package:gpsd/pages/qrcode.dart';

import 'maps.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
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
                  const Text('W.M.K Walisundara',
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
                child: Column(children:  const [
                  Homebuttons(
                      iconImagePath1: 'lib/icons/vaccination.png',
                      buttonText: 'Vaccination History', 
                      page: QRPage(),),
                  SizedBox(
                    height: 20,
                  ),
                  Homebuttons(
                      iconImagePath1: 'lib/icons/vaccine.png',
                      buttonText: 'Next Vaccines',
                      page: QRPage(),),
                ])),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
