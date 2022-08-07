import 'package:flutter/material.dart';
import 'package:gpsd/pages/qrcode.dart';

class VaccineHistroy extends StatefulWidget {
  const VaccineHistroy({Key? key}) : super(key: key);
  @override
  State<VaccineHistroy> createState() => _VaccineHistroyState();
}

class _VaccineHistroyState extends State<VaccineHistroy> {
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
                      horizontal: 5.0, vertical: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Vaccine History',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Icon(
                  Icons.vaccines,
                  color: Colors.grey,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Vaccine History",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
              ]),
            ),
          ),
        ));
  }
}
