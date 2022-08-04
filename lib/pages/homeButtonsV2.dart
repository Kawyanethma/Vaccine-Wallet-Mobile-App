import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gpsd/pages/homePage.dart';

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
          onTap: () {
            Navigator.of(context).push(
               MaterialPageRoute(
                  builder: (context) => page,
                )
            );
          },
          child: Ink(
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
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
              child: Center(child: Image.asset(iconImagePath)),
            ),
          ),
        ),
        //to get gap
        SizedBox(
          height: 10,
        ),
        //text
        Text(
          buttonText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}
