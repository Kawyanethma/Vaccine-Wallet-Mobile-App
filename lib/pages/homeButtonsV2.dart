import 'package:flutter/material.dart';

class homebuttonsV2 extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;

  const homebuttonsV2({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        Container(
          height: 80,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(child: Image.asset(iconImagePath)),
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
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
