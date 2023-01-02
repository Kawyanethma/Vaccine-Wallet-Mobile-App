import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ChildrenPreferences {
  static late SharedPreferences _preferences;

  static const _keyChildren = 'Children';
  static var myChildren = Children(
    name: 'test',
    id: '20002314020123',
    age: '9',
    gender: 'male',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setChildren(Children Children) async {
    final json = jsonEncode(Children.toJson());
    await _preferences.setString(_keyChildren, json);
  }

  static Children getChildren() {
    final json = _preferences.getString(_keyChildren);

    return json == null ? myChildren : Children.fromJson(jsonDecode(json));
  }
}

// Children calss

class Children {
  String name;
  String id;
  String age;
  String gender;

  Children({
    required this.name,
    required this.id,
    required this.age,
    required this.gender
  });

  Children copy({
    String? name,
    String? id,
    String? age,
    String? gender,
  }) =>
      Children(
        name: name ?? this.name,
        id: id ?? this.id,
        age: age ?? this.age,
        gender: gender?? this.gender,
      );

  static Children fromJson(Map<String, dynamic> json) => Children(
        name: json['name'],
        id: json['id'],
        age: json['age'],
        gender: json['gender'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'age': age,
        'gender': gender,
      };
}
