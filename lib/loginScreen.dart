import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gpsd/main.dart';
import 'package:gpsd/utils/firebase_user_preferences.dart';
import 'package:gpsd/utils/user_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum ButtonState { init, loading, done }

class _LoginPageState extends State<LoginPage> {
  final formKeyLogin = GlobalKey<FormState>();
  ButtonState state = ButtonState.init;
  bool isAnimating = true;
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  String Password = '';
  bool isPasswordVisble = true;
  bool wrongPassowrd = false;
  bool wrongUser = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    bool isStretched = isAnimating || state == ButtonState.init;
    bool isDone = state == ButtonState.done;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => state == ButtonState.init
                    ? Navigator.pop(context, true)
                    : null,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              );
            }),
          ),
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SingleChildScrollView(
              child: Form(
                  key: formKeyLogin,
                  child: Column(children: [
                    Column(children: [
                      Column(
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Login to your vaccine wallet account',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 81, 81, 81)),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                    ]),
                    Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                                primary: Color.fromARGB(255, 27, 110, 178))),
                        child: makeIdTextField()),
                    SizedBox(height: 30),
                    Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                                primary: Color.fromARGB(255, 27, 110, 178))),
                        child: makePasswordTextField()),
                    SizedBox(height: 40),
                    Hero(
                        transitionOnUserGestures: true,
                        tag: 'login',
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          width: state == ButtonState.init
                              ? MediaQuery.of(context).size.width
                              : 70,
                          height: 60,
                          onEnd: () =>
                              setState(() => isAnimating = !isAnimating),
                          child: isStretched
                              ? bulidButton()
                              : bulidLoadingButton(isDone),
                        )),
                  ])),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeIdTextField() => TextFormField(
      controller: idController,
      decoration: InputDecoration(
          hintText: 'Enter your NIC',
          labelText: 'NIC number',
          prefixIcon: Icon(
            Icons.contact_page_rounded,
          ),
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (idController.text.isNotEmpty && idController.text.length < 10) {
          return 'Wrong NIC number';
        } else if (idController.text.isEmpty) {
          return 'Enter NIC number';
        } else if (wrongUser) {
          return 'User not registered';
        } else {
          return null;
        }
      }
      // autofocus: true,
      );

  Widget makePasswordTextField() => TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: 'Password',
          // errorText: 'Password wrong',
          prefixIcon: Icon(
            Icons.key,
          ),
          suffixIcon: passwordController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: isPasswordVisble
                      ? Icon(
                          Icons.visibility_off_rounded,
                          color: Color.fromARGB(255, 51, 172, 55),
                        )
                      : Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 196, 47, 36),
                        ),
                  onPressed: () =>
                      setState(() => isPasswordVisble = !isPasswordVisble),
                ),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        validator: (value) {
          if (passwordController.text.isNotEmpty &&
              idController.text.length < 10) {
            return 'Wrong Password';
          } else if (passwordController.text.isEmpty) {
            return 'Enter Password';
          } else if (wrongPassowrd) {
            return 'Wrong Password';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordVisble,
      );

  Widget bulidButton() => MaterialButton(
        minWidth: double.infinity,
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Color.fromARGB(255, 50, 50, 50),
        child: FittedBox(
          child: Text('Login',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
        ),
        onPressed: () async {
          print(state.toString());
          setState(() => state = ButtonState.loading);
          // await Future.delayed(Duration(seconds: 2));
          formKeyLogin.currentState!.validate();
          if (idController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            readUserFromFireBase();
          } else {
            setState(() => state = ButtonState.init);
          }
        },
      );

  Future readUserFromFireBase() async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(idController.text);
      final snapshot = await docUser.get();
      firebaseUser user = firebaseUserPreferences.getfirebaseUser();
      if (snapshot.exists) {
        setState(() => wrongUser = false);
        formKeyLogin.currentState!.validate();
        await firebaseUserPreferences
            .setfirebaseUser(firebaseUser.fromJson(snapshot.data()!));
        user = firebaseUserPreferences.getfirebaseUser();
        print(user.password);
        if (passwordController.text.trim() == user.password) {
          setState(() => wrongPassowrd = false);
          formKeyLogin.currentState!.validate();
          setState(() => state = ButtonState.done);
          User userLocal = UserPreferences.getUser();
          userLocal = userLocal.copy(loginState: true);
          userLocal =
              userLocal.copy(name: '${user.firstName} ${user.lastName}');
          UserPreferences.setUser(userLocal);
          print(userLocal.loginState);
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        } else {
          setState(() => wrongPassowrd = true);
          formKeyLogin.currentState!.validate();
          setState(() => state = ButtonState.init);
        }
        formKeyLogin.currentState!.validate();
      } else {
        setState(() => state = ButtonState.init);
        setState(() => wrongUser = true);
      }

      user = user.copy(password: '');
      firebaseUserPreferences.setfirebaseUser(user);
      print(user.password);
    } on FirebaseException catch (e) {
      print(e);
      showTextSnackBar(context, 'Check your connection');
      setState(() => state = ButtonState.init);
    }
  }

  Widget bulidLoadingButton(bool isDone) {
    final color = isDone ? Colors.green : Color.fromARGB(255, 50, 50, 50);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ? Icon(
                Icons.done,
                color: Colors.white,
                size: 35,
              )
            : CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}

void showTextSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    backgroundColor: Color.fromARGB(255, 106, 0, 0),
    duration: Duration(seconds: 3),
    content: Row(
      children: [
        Icon(
          Icons.wifi_off_rounded,
          color: Colors.white,
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
