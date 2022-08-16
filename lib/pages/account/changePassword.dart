import 'package:flutter/material.dart';
import 'package:gpsd/utils/user_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

enum ButtonState { init, loading, done }

class _ChangePasswordState extends State<ChangePassword> {
  ButtonState state = ButtonState.init;
  User user = UserPreferences.getUser();
  bool isAnimating = true;
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  bool isPasswordVisible = true;
  bool isPasswordConfirmVisible = true;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 20.0),
                  child: Column(children: [
                    Row(
                      children: const [
                        Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ]),
                ),
                makePasswordTextField(),
                makeConfirmPasswordTextField(),
              ]),
            ),
          ),
        ));
  }

  Widget makeConfirmPasswordTextField() => TextFormField(
      controller: passwordConfirmController,
      decoration: InputDecoration(
        hintText: 'Confirm your Password',
        labelText: 'Confirm Password',
        // errorText: 'Password wrong',
        prefixIcon: Icon(
          Icons.key_rounded,
        ),
        suffixIcon: passwordConfirmController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: isPasswordConfirmVisible
                    ? Icon(
                        Icons.visibility_off_rounded,
                        color: Color.fromARGB(255, 51, 172, 55),
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color.fromARGB(255, 196, 47, 36),
                      ),
                onPressed: () => setState(
                    () => isPasswordConfirmVisible = !isPasswordConfirmVisible),
              ),
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: isPasswordConfirmVisible,
      validator: (value) {
        if (value != null &&
            (passwordConfirmController.text == passwordController.text)) {
          return null;
        } else {
          return 'Not match with password you entered';
        }
      });

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
