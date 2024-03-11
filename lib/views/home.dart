import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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



        ],
      ),
    );
  }
}
