import 'package:flutter/material.dart';
import 'package:gpsd/pages/about.dart';
import 'package:gpsd/pages/notifications.dart';
import 'HomeButtons.dart';
import 'location.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: ListView(padding: const EdgeInsets.all(24), children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 80.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Column(children:  const [
                  Homebuttons(
                      iconImagePath1: 'lib/icons/notification.png',
                      buttonText: 'Notifications',
                      page: Notification_settings(),),
                  SizedBox(
                    height: 30,
                  ),
                  Homebuttons(
                      iconImagePath1: 'lib/icons/location.png',
                      buttonText: 'Location',
                      page: Location_settings(),),
                  SizedBox(
                    height: 30,
                  ),
                  Homebuttons(
                      iconImagePath1: 'lib/icons/info.png',
                      buttonText: 'About',
                      page: About_settings(),),
                ]),
          ]),
        ));
  }
}
