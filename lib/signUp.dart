import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int currentStep = 0;
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
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
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
            body: Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  print("completed");
                } else {
                  setState(() => currentStep += 1);
                }
              },
              onStepCancel: () => currentStep == 0
                  ? Navigator.pop(context, true)
                  : setState(() => currentStep -= 1),
            )));
  }

  List<Step> getSteps() => [
        Step(
            isActive: currentStep >= 0,
            title: Text('Verification'),
            content: Container(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Step(
            isActive: currentStep >= 1,
            title: Text('Account'),
            content: Container(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Step(
            isActive: currentStep >= 2,
            title: Text('Complete'),
            content: Container(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ];
}
