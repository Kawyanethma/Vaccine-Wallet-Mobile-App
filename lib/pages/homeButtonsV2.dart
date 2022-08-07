import 'package:flutter/material.dart';

import '../animation/animationUp.dart';

class homebuttonsV2 extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  final StatefulWidget page;

  const homebuttonsV2({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          customBorder: const StadiumBorder(),
          onTap: () {
            Navigator.push(context, MyAnimationUp(page: page));
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-6, -6),
                  color: Colors.white,
                  blurRadius: 10,
                ),
                BoxShadow(
                  offset: Offset(6, 6),
                  color: Color(0xFFA7A9AF),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              child: Center(child: Image.asset(iconImagePath)),
            ),
          ),
        ),
        //to get gap
        const SizedBox(
          height: 10,
        ),
        //text
        Text(
          buttonText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}
