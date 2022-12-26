import 'package:flutter/material.dart';

class NoChildren extends StatefulWidget {
  const NoChildren({Key? key}) : super(key: key);

  @override
  State<NoChildren> createState() => _NoChildrenState();
}

class _NoChildrenState extends State<NoChildren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
          const Icon(
            Icons.no_accounts_outlined,
            color: Colors.grey,
            size: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "No accounts found",
            style: TextStyle(
                fontSize: 19,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "No children to show.If you have link your child details to acoount those are show here.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
