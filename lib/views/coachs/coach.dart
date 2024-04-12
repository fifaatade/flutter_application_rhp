import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/appDrawerCoach.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:flutter_application_rhp/views/entreprise/createProgram.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Coach extends StatefulWidget {
  const Coach({super.key});

  @override
  State<Coach> createState() => _CoachState();
}

class _CoachState extends State<Coach> {
  var show_all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "",
          goBack: false,
          colr: Color(0xFF0a3622),
        ),
      ),
      backgroundColor: Color(0xFF0a3622),
      endDrawer: AppDrawerCoach(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 150,
                child: CircleAvatar(
                  child: Image.asset("assets/images/logo.png"),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 444,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "C'est quoi RHP?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Kanit"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cette application vise à assurer le suivi et l'accompagnement des filles après leur participation au programme Reveal Her Potential. L’utilisateur dans cette application  se retrouve dans un espace convivial où les bénéficaires continuent d’accéder à un soutien et un appuie constant pour la réalisation effective de leur objectif entreprenarial.",
                    textAlign: TextAlign.justify,
                  ),
                  
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
