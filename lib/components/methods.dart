import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getToken() {
    String jsonString = _preferences.getString('user') ?? '';
    if (jsonString.isEmpty) {
      return '';
    } else {
      Map<String, dynamic> jsonObject = jsonDecode(jsonString);

      return jsonObject['data']['accessToken'];
    }
  }

  void deleteToken() {
    _preferences.remove('user');
    _preferences.remove('user_id');
  }

  static String getFullName() {
    String jsonString = _preferences.getString('user') ?? '';
    Map<String, dynamic> jsonObject = jsonDecode(jsonString);

    return jsonObject['data']['userData']['fullName'];
  }

  static String getUserId() {
    String jsonString = _preferences.getString('user') ?? '';
    Map<String, dynamic> jsonObject = jsonDecode(jsonString);

    return jsonObject['data']['userData']['id'];
  }
}

String getInitials(dynamic fullName) {
  List<String> nameParts = fullName.split(" ");

  List<String> initials = nameParts.map((part) {
    if (part.isNotEmpty) {
      return part[0].toUpperCase();
    } else {
      return '';
    }
  }).toList();

  return initials.take(2).join();
}

bool validateEmail(String email) {
  // Expression régulière pour la validation d'une adresse e-mail
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Vérifie si l'e-mail correspond à la regex
  return emailRegex.hasMatch(email);
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
