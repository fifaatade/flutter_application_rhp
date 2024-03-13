import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/views/entreprise/createProgram.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          ElevatedButton(
              child: Text("Créer un programme"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateProgram()));
              }),
        ],
      )),
    );
  }
}
