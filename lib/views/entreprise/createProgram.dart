import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enterprisePage.dart';

class CreateProgram extends StatefulWidget {
  const CreateProgram({super.key});

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          TextField(
              decoration: InputDecoration(
            hintText: "Programme",
            hintStyle: TextStyle(color: Colors.white),
            labelText: "Nom du programme",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
          SizedBox(height: 20),
          TextField(
              decoration: InputDecoration(
            hintText: "Description",
            hintStyle: TextStyle(color: Colors.white),
            labelText: "Description du programme",
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
          SizedBox(height: 20),
          ElevatedButton(
              child: Text("Soumettre"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EnterprisePage()));
              }),
          
        ],
      ),
    );
  }
}
