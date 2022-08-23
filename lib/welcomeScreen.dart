import 'package:flutter/material.dart';
import 'package:gpsd/loginScreen.dart';
import 'package:gpsd/signUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Vaccine Wallet',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Digitalized your traditional vaccine card.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/FirstScreen.png'))),
                ),
                Column(
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: 'login',
                      child: MaterialButton(
                        elevation: 0,
                        minWidth: double.infinity,
                        height: 60,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Color.fromARGB(255, 50, 50, 50),
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        onPressed: (() => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Hero(
                        transitionOnUserGestures: true,
                        tag: 'signup',
                        child: MaterialButton(
                          elevation: 0,
                          minWidth: double.infinity,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Color.fromARGB(255, 27, 110, 178),
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          onPressed: (() => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()))),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
