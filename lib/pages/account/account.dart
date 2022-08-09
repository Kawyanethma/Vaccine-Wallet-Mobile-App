import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpsd/utils/user_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:gpsd/pages/account/changeMobile.dart';
import 'package:gpsd/pages/account/changePassword.dart';
import 'package:gpsd/utils/homeButtons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late User user;

  Future pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final directory = await getApplicationDocumentsDirectory();
      final name;
      if (basename(user.imagePath) == 'profile1') {
        name = 'profile2';
      } else {
        name = 'profile1';
      }
      final imageFile = File('${directory.path}/$name');
      final newImage = await File(image.path).copy(imageFile.path);
      setState(() {
        user = user.copy(imagePath: newImage.path);
        UserPreferences.setUser(user);
      });
      showTextSnackBar(context, 'Profile picture updated');
      print(user.imagePath);
    } on PlatformException catch (e) {
      print(('Fail to pick iamge: $e'));
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
                CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      pickImage(ImageSource.camera, context);
                    }),
                CupertinoActionSheetAction(
                    child: Text('Gallery'),
                    onPressed: () {
                      pickImage(ImageSource.gallery, context);
                    }),
              ]));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.camera_alt,color: Colors.deepOrange,),
                      title: Text('Camera'),
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.camera)),
                  ListTile(
                      leading: Icon(Icons.photo,color: Colors.green,),
                      title: Text('Gallery'),
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.gallery))
                ],
              ));
    }
  }

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 80.0),
                      child: Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 1.0,
                    )),
                    InkWell(
                      onTap: () async {
                        final source = await showImageSource(context);
                        if (source == null) return;
                        pickImage(source, context);
                      },
                      child: user.imagePath != ''
                          ? Stack(
                              children: [
                                ClipOval(
                                  child: Material(
                                      child: Ink.image(
                                          image:
                                              FileImage(File(user.imagePath)),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 4,
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                            border: Border.all(
                                                width: 4.5,
                                                color: const Color.fromARGB(
                                                    255, 224, 224, 224))),
                                        child: const Icon(Icons.edit,
                                            size: 20, color: Colors.white)))
                              ],
                            )
                          : const CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage('lib/icons/user.png'),
                              backgroundColor: Colors.lightGreen,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Kawyanethma',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text('ID Number: 200*********',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(children: const [
                  Homebuttons(
                    iconImagePath1: 'lib/icons/phone.png',
                    buttonText: 'Mobile Number',
                    page: ChangeMobile(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Homebuttons(
                    iconImagePath1: 'lib/icons/password.png',
                    buttonText: 'Change Password',
                    page: ChangePassword(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ])),
        ));
  }
}

void showTextSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 3),
    content: Row(
      children: [
        Text(
          text + '  \t',
          style: TextStyle(fontSize: 16),
        ),
        Icon(
          Icons.done,
          color: Colors.white,
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
