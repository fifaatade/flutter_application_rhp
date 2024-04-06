import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: "CRÉER UN PROGRAMME", goBack: true),
      ),
      backgroundColor: Color.fromARGB(14, 0, 0, 0),
      endDrawer: AppDrawer(),      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: "Programme",
              hintStyle: TextStyle(color: Colors.black),
              labelText: "Nom du programme",
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.black),
              labelText: "Description du programme",
              labelStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )),
          ),
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
