// import 'package:ded_mini_pos/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:flutter_application_rhp/views/entreprise/createProgram.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_rhp/components/methods.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
                          getInitials("John Doe"),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Doe",
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
                        child: Text("Entreprise".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      const SizedBox(height: 20.0),
                      ListTile(
                        textColor: Colors.black.withOpacity(0.9),
                        iconColor: Colors.black.withOpacity(0.9),
                        leading: const Icon(Icons.shopping_bag_outlined),
                        title: Text('Créer un programme',
                            style: TextStyle(
                              fontSize: 17.0,
                            )),
                
                        onTap: () {
                          Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateProgram()));
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
                            leading: const Icon(Icons.category_outlined),
                            title: Text('Catalogue',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.group_outlined),
                            title: Text('Clients',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {},
                          ),
                        ],
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
                            leading: const Icon(Icons.receipt_long_outlined),
                            title: Text('Historique des ventes',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.dashboard_outlined),
                            title: Text('Statistiques',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {},
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
                            leading: const Icon(Icons.settings_outlined),
                            title: Text('Paramètres',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, '/sale');
                            },
                          ),
                          ListTile(
                            textColor: Colors.black.withOpacity(0.9),
                            iconColor: Colors.black.withOpacity(0.9),
                            leading: const Icon(Icons.logout_outlined),
                            title: Text('Déconnexion',
                                style: TextStyle(
                                  fontSize: 17.0,
                                )),
                            onTap: () async{
                                FirebaseAuth.instance.signOut();
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool("isFirstLogin", false);
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const Login()),
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
                            'MA-INFO',
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
