import 'package:flutter/material.dart';
import 'package:gpsd/pages/qrcode.dart';

class ChangeMobile extends StatefulWidget {
  const ChangeMobile({Key? key}) : super(key: key);
  @override
  State<ChangeMobile> createState() => _ChangeMobileState();
}

class _ChangeMobileState extends State<ChangeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Navigator.pop(context, true),
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
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Mobile Number',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Row(
                        children: const [
                          Text(
                            'Current mobile number',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '0710712802',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
