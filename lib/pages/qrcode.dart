import 'package:flutter/material.dart';
import 'package:gpsd/main.dart';
import 'package:gpsd/pages/account.dart';
import 'package:gpsd/pages/homeButtons.dart';
import 'package:gpsd/pages/homeButtonsV2.dart';
import 'package:gpsd/pages/Navbar.dart';
import 'package:gpsd/pages/homePage.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: Navbar(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Navigator.pop(context,true),
            padding: EdgeInsets.only(left: 20.0),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          );
        }),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: Text(
          'QR Code',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   Builder(builder: (context) {
        //     return IconButton(
        //       onPressed: () => Scaffold.of(context).openEndDrawer(),
        //       padding: EdgeInsets.only(right: 35.0),
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.black,
        //         size: 35,
        //       ),
        //     );
        //   }),
        // ]
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
          child: Column(children: [
            const SizedBox(height: 10),
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
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 36, 139, 199),
                      Color.fromARGB(255, 34, 34, 34),
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
                    children: [
                      const Text('Next Vaccine : ',
                          style: TextStyle(color: Colors.white)),
                      const Text('09/22',
                          style: TextStyle(color: Colors.white)),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // const homebuttonsV2(
                //   iconImagePath: 'lib/icons/children.png',
                //   buttonText: 'Children',
                // ),
                // const homebuttonsV2(
                //   iconImagePath: 'lib/icons/qr.png',
                //   buttonText: 'QR Code',
                // ),
                // const homebuttonsV2(
                //   iconImagePath: 'lib/icons/map.png',
                //   buttonText: 'Map',
                // ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(children: const [
                  Homebuttons(
                      iconImagePath1: 'lib/icons/vaccination.png',
                      buttonText: 'Vaccination History'),
                  SizedBox(
                    height: 20,
                  ),
                  Homebuttons(
                      iconImagePath1: 'lib/icons/vaccine.png',
                      buttonText: 'Next Vaccines'),
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
