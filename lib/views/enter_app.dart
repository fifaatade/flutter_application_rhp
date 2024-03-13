import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/views/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

import 'auth/login.dart';

class EnterApp extends StatefulWidget {
  const EnterApp({super.key});

  @override
  State<EnterApp> createState() => _EnterAppState();
}

class _EnterAppState extends State<EnterApp> {
  TextStyle myTextStyle() => const TextStyle(
        color: Colors.white,
        fontSize: 20,
      );

  @override
  
  void initState() {
    Timer(Duration(seconds: 2), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isFirstTime = await prefs.getBool("isFirstTime");
      bool? isFirstLogin = await prefs.getBool("isFirstLogin");

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => isFirstTime == false ? Login() : Onboarding(),
        ),
        (route) => false,
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => isFirstLogin == false ? Login() : Home(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
