import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/appDrawerBenef.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';

class Ressource extends StatefulWidget {
  const Ressource({super.key});

  @override
  State<Ressource> createState() => _RessourceState();
}

class _RessourceState extends State<Ressource> {
  @override
    final events = [
    {
      "speaker": "Ressource 1",
      "date": "Il s'agit d'un livre de développement personnel...",
      "subject": "www.livre.com",
    },
    {
      "speaker": "Ressource 2",
      "date": "Le leadership au service de vos convictions  ...",
      "subject": "www.leader.com",
    },
    
  ];
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "Ressources",
          goBack: true,
        ),
      ),
      backgroundColor: Color.fromARGB(14, 0, 0, 0),
      endDrawer: AppDrawerBenef(),

      body: Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final speaker = event['speaker'];
          final date = event['date'];
          final subject = event['subject'];

          return Card(
            child: ListTile(
              leading: Icon(Icons.book_online_outlined),
              title: Text("$speaker ($date)"),
              subtitle: Text("$subject"),
              trailing: Icon(Icons.info),
            ),
          );
        },
      ),
    )

    
    );
 
  }
}