import 'package:flutter/material.dart';
import 'package:gpsd/main.dart';
import 'package:gpsd/pages/homeButtons.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Navigator.pop(context,true),
            padding: const EdgeInsets.only(left: 20.0),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          );
        }),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
          child: Column(children: [
            Row(children: const [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.0, vertical: 30.0),
                  child: Text('QR Code',
                  style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
               ),
              ),
            ],),
            const SizedBox(height: 20),
            //card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                width: 350,
                height: 200,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 26, 109, 161),
                      Color.fromARGB(255, 55, 55, 55),                  
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                    Text('Scan Me',
                    style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
              ),
              ),
           ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/icons/qrcode.png', height: 120),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  const [
                    SizedBox(height: 80),
                    Text('Next Vaccine:  \t',
                      style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                ),
                ),
                Text('No vaccine to get',
                      style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                ),
                ),
              ],),
              ],
            ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
              child:Column(
              children: const [
              Icon(
              Icons.info_outline_rounded,
              size: 80,
              color: Colors.red,
              ),
              SizedBox(height: 15),
              Text('Show QR code to medical officer, then they can know about your vaccine deatils.\n*If QR code not clear tap on it to zoom it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
         ]),
      ),
      ]),
      ),
      ),
    );
  }
}
