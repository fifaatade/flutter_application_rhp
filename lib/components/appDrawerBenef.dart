// import 'package:ded_mini_pos/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:flutter_application_rhp/views/beneficiaire/connBenef.dart';
import 'package:flutter_application_rhp/views/beneficiaire/inscriptionBenef.dart';
import 'package:flutter_application_rhp/views/chats/communaute.dart';
import 'package:flutter_application_rhp/views/chats/discussion.dart';
import 'package:flutter_application_rhp/views/coachs/inscriptionCoach.dart';
import 'package:flutter_application_rhp/views/connection_side.dart';
import 'package:flutter_application_rhp/views/entreprise/addRessource.dart';
import 'package:flutter_application_rhp/views/entreprise/coachingList.dart';
import 'package:flutter_application_rhp/views/entreprise/createProgram.dart';
import 'package:flutter_application_rhp/views/entreprise/enterprisePage.dart';
import 'package:flutter_application_rhp/views/entreprise/resource.dart';
import 'package:flutter_application_rhp/views/entreprise/shareOpportunities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_rhp/components/methods.dart';

class AppDrawerBenef extends StatefulWidget {
  const AppDrawerBenef({super.key});

  @override
  State<AppDrawerBenef> createState() => _AppDrawerBenefState();
}

class _AppDrawerBenefState extends State<AppDrawerBenef> {
  // String fullName = Config.getFullName();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.grey[70],
      ),
      child: Drawer(
        width: 350,
        child: Container(
          color: Theme.of(context).colorScheme.tertiary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 130.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        child: Text(
                          getInitials("Myriam ADE"),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Myriam ADE",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black.withOpacity(0.9),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text("Bénéficiaire".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        textColor: Colors.black.withOpacity(0.9),
                        iconColor: Colors.black.withOpacity(0.9),
                        leading: const Icon(Icons.video_call_outlined),
                        title: Text('coaching',
                            style: TextStyle(
                              fontSize: 17.0,
                            )),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CoachingList()));
                        },
                      ),
                      const Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                        children: [
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading:
                                const Icon(Icons.chat_bubble_outline_outlined),
                            title: Text('Démarrer une discussion',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ));
                            },
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.group_outlined),
                            title: Text('Communauté',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreenCom(),
                              ));
                            },
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.present_to_all_outlined),
                            title: Text(' Ressources',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Ressource()),
                              );
                            },
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.share),
                            title: Text('Opportunités',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EnterprisePage()),
                              );
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white70,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Column(
                        children: [
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.logout_outlined),
                            title: Text('Déconnexion',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () async {
                              FirebaseAuth.instance.signOut();
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool("isFirstLoginB", false);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConnexionSide()),
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 100.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'rhp',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
