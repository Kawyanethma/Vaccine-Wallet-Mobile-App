import 'package:flutter/material.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({Key? key}) : super(key: key);
  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Navigator.pop(context, true),
              padding: const EdgeInsets.only(left: 20.0),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            );
          }),
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                Row(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 25.0),
                      child: Text(
                        'Children',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                const Icon(
                  Icons.add_circle,
                  color: Colors.grey,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Add children",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "No children to show.You can add your children to your account using add button.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
          ),
        ));
  }
}
