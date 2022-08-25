import 'package:flutter/material.dart';

import 'package:gpsd/utils/user_preferences.dart';

class ChangeMobile extends StatefulWidget {
  const ChangeMobile({Key? key}) : super(key: key);
  @override
  State<ChangeMobile> createState() => _ChangeMobileState();
}

enum ButtonState { init, loading, done }

class _ChangeMobileState extends State<ChangeMobile> {
  final formKeyChangeMobile = GlobalKey<FormState>();
  ButtonState state = ButtonState.init;
  User user = UserPreferences.getUser();
  bool isAnimating = true;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
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
                  onPressed: () => Navigator.pop(context, true),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                          primary: Color.fromARGB(255, 2, 92, 128))),
                  child: Form(
                    key: formKeyChangeMobile,
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
                            Text(
                              user.mobile,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 30),
                            makePhoneTextField(),
                            SizedBox(height: 20),
                            makePasswordTextField(),
                            SizedBox(height: 40),
                            AnimatedContainer(
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
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget bulidButton() => MaterialButton(
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color.fromARGB(255, 50, 50, 50),
      child: FittedBox(
        child: Text('Change',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
      onPressed: () async {
        print(state.toString());
        if (formKeyChangeMobile.currentState!.validate()) {
          setState(() => state = ButtonState.loading);
          await Future.delayed(Duration(seconds: 2));
          setState(() => state = ButtonState.done);
          await Future.delayed(Duration(seconds: 1));
          setState(() {
            user.mobile = phoneController.text;
            UserPreferences.setUser(user);
          });
          // databse coonnec}tion
        }
        ;
      });

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

  Widget makePhoneTextField() => TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
            hintText: '071 234 5678',
            labelText: 'New mobile number',
            prefixIcon: Icon(Icons.phone_iphone),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (phoneController.text.isNotEmpty &&
              phoneController.text.length < 10) {
            return 'Wrong phone number';
          } else if (phoneController.text.isEmpty) {
            return 'Enter new mobile number';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        autofocus: true,
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
                  icon: isPasswordVisible
                      ? Icon(
                          Icons.visibility_off_rounded,
                          color: Color.fromARGB(255, 51, 172, 55),
                        )
                      : Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 196, 47, 36),
                        ),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordVisible,
        validator: (value) {
          if (value != null && value.length <= 6) {
            return 'Password should be more than 6 charecters ';
          } else {
            return null;
          }
        },
      );
}
