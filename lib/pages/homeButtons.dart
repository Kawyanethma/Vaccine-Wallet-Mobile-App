import 'package:flutter/material.dart';

class homebuttons extends StatelessWidget {
  final String iconImagePath1;
  final String iconImagePath2;
  final String buttonText;

  const homebuttons({
    Key? key,
    required this.iconImagePath1,
    required this.iconImagePath2,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        InkWell(
          onTap: () {
            print("Container clicked");
          },
        child: Ink(
        child: Container(
          height: 80,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            //border: Border.all(color: Colors.black),
             boxShadow: [
               BoxShadow(
                 offset: Offset(-15, -15),
                 color: Colors.white,
                 blurRadius: 30,
               ),
               BoxShadow(
                 offset: Offset(15, 15),
                 color: Color(0xFFA7A9AF),
                 blurRadius: 30,
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
                    color: Color.fromARGB(255, 19, 55, 87),
                  )),
              Image.asset(iconImagePath2),
            ],
          ),
        ),),),
      ],
    );
  }
}
