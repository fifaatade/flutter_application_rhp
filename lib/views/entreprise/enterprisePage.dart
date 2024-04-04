import 'package:flutter/material.dart';


class EnterprisePage extends StatefulWidget {
  const EnterprisePage({super.key});

  @override

  State<EnterprisePage> createState() => _EnterprisePageState();
}

class _EnterprisePageState extends State<EnterprisePage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu_sharp),
                color: Color.fromARGB(255, 234, 231, 231),
              ),
              trailing: Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        ),
    );
  }
}