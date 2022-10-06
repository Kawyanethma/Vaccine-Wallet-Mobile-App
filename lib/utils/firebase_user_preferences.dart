import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class firebaseUserPreferences {
  static late SharedPreferences _firebasepreferences;

  static const _keyfirebaseUser = 'firebaseUser';
  static var myfirebaseUser = firebaseUser(
    password: '',
    firstName: '',
    lastName: '',
    id: '',
    mobile: '',
    log: false,
  );

  static Future init() async =>
      _firebasepreferences = await SharedPreferences.getInstance();

  static Future setfirebaseUser(firebaseUser firebaseUser) async {
    final json = jsonEncode(firebaseUser.toJson());
    await _firebasepreferences.setString(_keyfirebaseUser, json);
  }

  static firebaseUser getfirebaseUser() {
    final json = _firebasepreferences.getString(_keyfirebaseUser);

    return json == null
        ? myfirebaseUser
        : firebaseUser.fromJson(jsonDecode(json));
  }
}

// firebaseUser calss

class firebaseUser {
  String password;
  String firstName;
  String lastName;
  String id;
  String mobile;
  bool? log;

  firebaseUser({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.mobile,
    required this.log,
  });

  firebaseUser copy({
    String? password,
    String? firstName,
    String? lastName,
    String? id,
    String? mobile,
    bool? log,
  }) =>
      firebaseUser(
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        id: id ?? this.id,
        mobile: mobile ?? this.mobile,
        log: log ?? this.log,
      );

  static firebaseUser fromJson(Map<String, dynamic> json) => firebaseUser(
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        id: json['id'],
        mobile: json['mobile'],
        log: json['log'],
      );

  Map<String, dynamic> toJson() => {
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'id': id,
        'mobile': mobile,
        'log': log,
      };
}
