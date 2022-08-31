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
                appBar: AppBar(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 25.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Children',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
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
                  ),
                ));
  }
}