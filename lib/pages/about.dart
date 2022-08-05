import 'package:flutter/material.dart';

class About_settings extends StatefulWidget {
  const About_settings({Key? key}) : super(key: key);
  @override
  State<About_settings> createState() => _About_settingsState();
}

class _About_settingsState extends State<About_settings> {

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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(children: [
              Row(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.info_outline,
                color: Colors.blue,
                size: 80,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Vaccine Wallet 1.0v",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Trun on notifications to get details about new vaccines.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              ),
            ]),
          ),
        ));
  }
}