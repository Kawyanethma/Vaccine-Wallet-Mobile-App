import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum ButtonState { init, loading, done }

class _SignUpPageState extends State<SignUpPage> {
  ButtonState state = ButtonState.init;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final idController = TextEditingController();
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  int currentStep = 0;

  bool snapsnotExists = false;
  bool isPasswordVisible = true;
  bool isPasswordConfirmVisible = true;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(() => setState(() {}));
    passwordConfirmController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 27, color: Colors.black, fontWeight: FontWeight.w500),
          ),
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
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                  primary: Color.fromARGB(255, 27, 110, 178))),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () async {
              if (currentStep == 2) {
                final isValidForm2 = formKey3.currentState!.validate();
                if (isValidForm2) {
                  final id = idController.text;
                  final password = passwordController.text;
                  final firstName = firstNameController.text;
                  final lastName = lastNameController.text;
                  final mobileNumber = phoneController.text;
                  addUserToFirebase(
                      id: id,
                      password: password,
                      firstName: firstName,
                      lastName: lastName,
                      mobileNumber: mobileNumber);
                }
              } else if (currentStep == 0) {
                !idController.text.isEmpty ? await readIDFromFireBase() : null;
                final isValidForm0 = formKey1.currentState!.validate();
                if (isValidForm0) {
                  setState(() => currentStep += 1);
                }
              } else if (currentStep == 1) {
                final isValidForm1 = formKey2.currentState!.validate();
                if (isValidForm1) {
                  setState(() => currentStep += 1);
                }
              }
            },
            onStepCancel: () => setState(() => currentStep -= 1),
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  if (currentStep != 0)
                    Expanded(
                        child: MaterialButton(
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: Color.fromARGB(255, 50, 50, 50),
                      child: Text('Back',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      onPressed: details.onStepCancel,
                    )),
                  if (currentStep != 0) SizedBox(width: 12),
                  Expanded(
                      child: Hero(
                          transitionOnUserGestures: true,
                          tag: 'signup',
                          child: MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              color: Color.fromARGB(255, 50, 50, 50),
                              child: state == ButtonState.init
                                  ? Text('Next',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                              onPressed: details.onStepContinue))),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Account'),
          content: Container(
            padding: EdgeInsets.fromLTRB(1, 1, 1, 30),
            child: Form(key: formKey1, child: makeIDTextField()),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Verification'),
          content: Container(
            padding: EdgeInsets.fromLTRB(1, 1, 1, 30),
            child: Form(key: formKey2, child: makePhoneTextField()),
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Complete'),
          content: Container(
            padding: EdgeInsets.fromLTRB(1, 1, 1, 30),
            child: SingleChildScrollView(
                child: Form(
              key: formKey3,
              child: Column(
                children: [
                  makeFirstNameTextField(),
                  makeLastNameTextField(),
                  makePasswordTextField(),
                  makeConfirmPasswordTextField()
                ],
              ),
            )),
          ),
        ),
      ];

  Widget makeIDTextField() => TextFormField(
        controller: idController,
        decoration: InputDecoration(
            hintText: 'Your NIC Number',
            labelText: 'NIC number',
            prefixIcon: Icon(Icons.contact_page),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (value != null && value.length < 10 && value.length > 0) {
            return 'Wrong ID number';
          } else if (idController.text.isEmpty) {
            return 'Enter NIC';
          } else if (!snapsnotExists) {
            return 'ID not found !!';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        autofocus: true,
      );
  Widget makePhoneTextField() => TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
            hintText: '071 234 5678',
            labelText: 'Mobile number',
            prefixIcon: Icon(Icons.phone_iphone),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (phoneController.text.isNotEmpty &&
              phoneController.text.length < 10) {
            return 'Wrong phone number';
          } else if (phoneController.text.isEmpty) {
            return 'Enter mobile number';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        autofocus: true,
      );
  Widget makeFirstNameTextField() => TextFormField(
        controller: firstNameController,
        decoration: InputDecoration(
            hintText: 'John',
            labelText: 'First Name',
            prefixIcon: Icon(Icons.abc_rounded),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (firstNameController.text.isEmpty) {
            return 'Enter First Name';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        autofocus: true,
      );
  Widget makeLastNameTextField() => TextFormField(
        controller: lastNameController,
        decoration: InputDecoration(
            hintText: 'Perera',
            labelText: 'Last Name',
            prefixIcon: Icon(Icons.abc),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(15))),
        validator: (value) {
          if (lastNameController.text.isEmpty) {
            return 'Enter Last Name';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
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
  void showTextSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future readIDFromFireBase() async {
    try {
      setState(() => state = ButtonState.loading);
      print(state);
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(idController.text);
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        print('user exists');
        snapsnotExists = true;
      } else {
        snapsnotExists = false;
      }
      setState(() => state = ButtonState.init);
    } on FirebaseException catch (e) {
      print(e);
      snapsnotExists = false;
      print('user not exists');
      setState(() => state = ButtonState.init);
    }
  }

  Future addUserToFirebase(
      {required String id,
      required String mobileNumber,
      required String firstName,
      required String lastName,
      required String password}) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(id);
    print(id);
    final json = {
      'log': true,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobileNumber,
      'password': password,
      'id': id
    };
    await docUser.set(json);
  }
}
