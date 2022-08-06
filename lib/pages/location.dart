import 'package:flutter/material.dart';


class Location_settings extends StatefulWidget {
  const Location_settings({Key? key}) : super(key: key);

  @override
  State<Location_settings> createState() => _Location_settingsState();
}

class _Location_settingsState extends State<Location_settings> {
  bool value = true;
  
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
                        'Location',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: value
                        ? const Color.fromARGB(255, 180, 210, 245)
                        : const Color.fromARGB(255, 187, 194, 250),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Use location',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Column(children: [
                          const SizedBox(height: 6),
                          buildHeader(child: buildSwitch()),
                        ])
                      ]),
                ),
                const SizedBox(
                  height: 80,
                ),
                Icon(
                  value ? Icons.location_on : Icons.location_off,
                  color: value ? Colors.green : Colors.red,
                  size: 80,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  value ? "Location is using." : "Location is not using.",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  value
                      ? "Location may use like GPS, Wi-Fi to help get your device location.Then we can show the nearest vaccine center."
                      : "Trun on location to see nearest vaccinne center.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ]),
            ),
          ),
        ));
  }

  Widget buildHeader({
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          child,
        ],
      );

  Widget buildSwitch() => Transform.scale(
        scale: 1.3,
        child: Switch.adaptive(
            activeColor: Color.fromARGB(255, 219, 232, 255),
            activeTrackColor: Color.fromARGB(255, 13, 112, 193),
            inactiveThumbColor: Color.fromARGB(255, 195, 195, 195),
            inactiveTrackColor: Color.fromARGB(255, 109, 105, 105),
            splashRadius: 30,
            value: value,
            onChanged: (value) {
              setState(() => this.value = value);
            }),
      );
}
