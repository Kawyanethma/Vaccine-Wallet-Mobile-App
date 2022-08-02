import 'package:flutter/material.dart';
import 'package:gpsd/pages/homeButtons.dart';
import 'package:gpsd/pages/homeButtonsV2.dart';
import 'package:gpsd/pages/Navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Navbar(),
      appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[300],
          titleSpacing: 25,
          title: Text('My Card',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
          
          actions:[ Builder(builder: (context){
          return IconButton(
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            padding: EdgeInsets.only(right: 35.0),
          icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 35,
          ),
          );
          }),]
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [

            SizedBox(height: 15),
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
                      Text(
                        'Vaccine Card',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    ],
                  ),
                  Text('', style: TextStyle(fontSize: 20)),
                  Text('W.M.K Walisundara',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  Text('Age : 22',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('', style: TextStyle(fontSize: 22)),
                  Row(
                    children: [
                      Text('Next Vaccine : ',
                          style: TextStyle(color: Colors.white)),
                      Text('09/22', style: TextStyle(color: Colors.white)),
                    ],
                  )
                ]),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homebuttonsV2(
                  iconImagePath: 'lib/icons/children.png',
                  buttonText: 'Children',
                ),
                homebuttonsV2(
                  iconImagePath: 'lib/icons/qr.png',
                  buttonText: 'QR Code',
                ),
                homebuttonsV2(
                  iconImagePath: 'lib/icons/map.png',
                  buttonText: 'Map',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(children: [
                  homebuttons(
                      iconImagePath1: 'lib/icons/vaccination.png',
                      iconImagePath2: 'lib/icons/next.png',
                      buttonText: 'Vaccination History'),
                  SizedBox(
                    height: 20,
                  ),
                  homebuttons(
                      iconImagePath1: 'lib/icons/vaccine.png',
                      iconImagePath2: 'lib/icons/next.png',
                      buttonText: 'Next Vaccines'),
                ])),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
