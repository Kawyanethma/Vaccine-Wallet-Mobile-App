import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static var myUser = User(
    password: '',
    imagePath: '',
    name: 'Kawyanethma Walisundara',
    id: '20002314020123',
    mobile: '0701234567',
    isLocation: false,
    isNotifications: false,
    loginState: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}

// user calss

class User {
  String password;
  String imagePath;
  String name;
  String id;
  String mobile;
  bool isLocation;
  bool isNotifications;
  bool loginState;

  User({
    required this.password,
    required this.imagePath,
    required this.name,
    required this.id,
    required this.mobile,
    required this.isLocation,
    required this.isNotifications,
    required this.loginState,
  });

  User copy({
    String? password,
    String? imagePath,
    String? name,
    String? id,
    String? mobile,
    bool? isLocation,
    bool? isNotifications,
    bool? loginState,
  }) =>
      User(
        password: password ?? this.password,
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        id: id ?? this.id,
        mobile: mobile ?? this.mobile,
        isLocation: isLocation ?? this.isLocation,
        isNotifications: isNotifications ?? this.isNotifications,
        loginState: loginState ?? this.loginState,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        password: json['password'],
        imagePath: json['imagePath'],
        name: json['name'],
        id: json['id'],
        mobile: json['mobile'],
        isLocation: json['isLocation'],
        isNotifications: json['isNotifications'],
        loginState: json['loginState'],
      );

  Map<String, dynamic> toJson() => {
        'password': password,
        'imagePath': imagePath,
        'name': name,
        'id': id,
        'mobile': mobile,
        'isLocation': isLocation,
        'isNotifications': isNotifications,
        'loginState': loginState,
      };
}
