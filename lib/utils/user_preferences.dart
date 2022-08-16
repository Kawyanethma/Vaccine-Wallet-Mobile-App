import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static var myUser = User(
    imagePath: '',
    name: 'Kawyanethma Walisundara',
    id: '20002314020123',
    mobile: '0701234567',
    isLocation: false,
    isNotifications: false,
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
  String imagePath;
  String name;
  String id;
  String mobile;
  bool isLocation;
  bool isNotifications;

  User({
    required this.imagePath,
    required this.name,
    required this.id,
    required this.mobile,
    required this.isLocation,
    required this.isNotifications,
  });

  User copy({
    String? imagePath,
    String? name,
    String? id,
    String? mobile,
    bool? isLocation,
    bool? isNotifications,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        id: id ?? this.id,
        mobile: mobile ?? this.mobile,
        isLocation: isLocation ?? this.isLocation,
        isNotifications: isNotifications ?? this.isNotifications,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        id: json['id'],
        mobile: json['mobile'],
        isLocation: json['isLocation'],
        isNotifications: json['isNotifications'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'id': id,
        'mobile': mobile,
        'isLocation': isLocation,
        'isNotifications': isNotifications,
      };
}
