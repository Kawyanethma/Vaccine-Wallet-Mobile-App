import 'package:flutter/material.dart';

class homebuttons extends StatelessWidget {
  final String iconImagePath1;
   final String iconImagePath2;
  final String buttonText;

  const homebuttons({Key? key,
   required this.iconImagePath1,
   required this.iconImagePath2,
   required this.buttonText,}) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        Container(
          height: 80,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(iconImagePath1),
              Text(buttonText,
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],)
            ),
            Image.asset(iconImagePath2),
          ],),
        ),        
      ],
    );
  }
}
