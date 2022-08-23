import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsd/appMain.dart';
import 'package:gpsd/loginScreen.dart';
import 'package:gpsd/signUp.dart';
import 'package:gpsd/utils/user_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gpsd/utils/firebase_user_preferences.dart';
import 'package:gpsd/welcomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserPreferences.init();
  await firebaseUserPreferences.init();
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
  User user = UserPreferences.getUser();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    if (user.loginState) {
      return AppMain();
    } else {
      return WelcomeScreen();
    }
  }

  Stream<bool?> userLogin() async* {
    user.loginState;
  }
}
