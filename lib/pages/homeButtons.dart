import 'package:flutter/material.dart';
import 'package:gpsd/animation/animationSlide.dart';

class Homebuttons extends StatelessWidget {
  final String iconImagePath1;
  final String buttonText;
  final StatefulWidget page;

  const Homebuttons ({
    Key? key,
    required this.iconImagePath1,
    required this.buttonText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        InkWell(
          onTap: () {
            Navigator.push(context, MyAnimationSlide(page: page));
          },
          child: Ink(
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(iconImagePath1),
                  Text(buttonText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  Image.asset('lib/icons/next.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
