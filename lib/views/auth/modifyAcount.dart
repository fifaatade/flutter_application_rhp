import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_rhp/views/auth/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../home.dart';

class ModifyAcount extends StatefulWidget {
  const ModifyAcount({super.key});

  @override
  State<ModifyAcount> createState() => _ModifyAcountState();
}

class _ModifyAcountState extends State<ModifyAcount> {
    bool loading = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool pswObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}