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
      appBar: AppBar(
        title: Text("Home"),
      ),
      backgroundColor: Color.fromARGB(255, 224, 245, 252),
      endDrawer: Drawer(
          child: ListView(children: [
        ListTile(
            title: Text("Créer un programme"),
            leading: Icon(Icons.domain_verification),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateProgram()),
              );
            }),
        ListTile(
            title: Text("Deconnexion"),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            })
      ])),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...[1, 2, 3]
                      .map((e) => Container(
                          height: 150,
                          width: 300,
                          color: Colors.white54,
                          child: Card(
                              elevation: 0,
                              child: Center(child: Text("hello")))))
                      .toList()
                ])),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateProgram()));
                },
                child: Text(
                  "Create Program",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}
