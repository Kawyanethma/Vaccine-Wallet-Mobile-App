import 'package:flutter/material.dart';
import 'package:gpsd/pages/account.dart';
import 'package:gpsd/pages/homePage.dart';
import 'package:gpsd/pages/settings.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final screens = [
    HomePage(),
    AccountPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )),
        child: NavigationBar(
            height: 60,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined), 
                  selectedIcon: Icon(Icons.account_circle),
                  label: "Account"),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined), 
                  selectedIcon: Icon(Icons.settings),
                  label: "Settings"),
            ]),
      ),
    );
  }
}
