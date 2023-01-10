import 'package:flutter/material.dart';
import 'package:gpsd/utils/user_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

enum ButtonState { init, loading, done }

class _ChangePasswordState extends State<ChangePassword> {
  final changePasswordKey = GlobalKey<FormState>();
  ButtonState state = ButtonState.init;
  User user = UserPreferences.getUser();
  bool isAnimating = true;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isPasswordConfirmVisible = true;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() => setState(() {}));
    newPasswordController.addListener(() => setState(() {}));
    passwordConfirmController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    bool isStretched = isAnimating || state == ButtonState.init;
    bool isDone = state == ButtonState.done;
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
              child: Form(
                key: changePasswordKey,
                child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                          primary: Color.fromARGB(255, 2, 92, 128))),
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
                    SizedBox(height: 20),
                    makeOldPasswordTextField(),
                    SizedBox(height: 20),
                    makeNewPasswordTextField(),
                    SizedBox(height: 20),
                    makeConfirmNewPasswordTextField(),
                    SizedBox(height: 40),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      width: state == ButtonState.init
                          ? MediaQuery.of(context).size.width
                          : 70,
                      height: 60,
                      onEnd: () => setState(() => isAnimating = !isAnimating),
                      child: isStretched
                          ? bulidButton()
                          : bulidLoadingButton(isDone),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ));
  }

  Widget makeConfirmNewPasswordTextField() => TextFormField(
      controller: passwordConfirmController,
      decoration: InputDecoration(
        hintText: 'Confirm your new Password',
        labelText: 'Confirm new Password',
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
            (passwordConfirmController.text == newPasswordController.text)) {
          return null;
        } else {
          return 'Not match with password you entered';
        }
      });

  Widget makeNewPasswordTextField() => TextFormField(
        controller: newPasswordController,
        decoration: InputDecoration(
          hintText: 'Enter your new password',
          labelText: 'New Password',
          // errorText: 'Password wrong',
          prefixIcon: Icon(
            Icons.key,
          ),
          suffixIcon: newPasswordController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: isNewPasswordVisible
                      ? Icon(
                          Icons.visibility_off_rounded,
                          color: Color.fromARGB(255, 51, 172, 55),
                        )
                      : Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 196, 47, 36),
                        ),
                  onPressed: () => setState(
                      () => isNewPasswordVisible = !isNewPasswordVisible),
                ),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: isNewPasswordVisible,
        validator: (value) {
          if (value != null && value.length <= 6) {
            return 'Password should be more than 6 charecters ';
          } else {
            return null;
          }
        },
      );
  Widget makeOldPasswordTextField() => TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Enter your old password',
          labelText: 'Old Password',
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
        if (changePasswordKey.currentState!.validate()) {
          setState(() => state = ButtonState.loading);
          await Future.delayed(Duration(seconds: 2));
          setState(() => state = ButtonState.done);
          await Future.delayed(Duration(seconds: 1));
          // databse coonnection
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
}
