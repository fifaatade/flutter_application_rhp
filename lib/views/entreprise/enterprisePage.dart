import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/appDrawerBenef.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';

class EnterprisePage extends StatefulWidget {
  const EnterprisePage({super.key});

  @override
  State<EnterprisePage> createState() => _EnterprisePageState();
}
  final events = [
    {
      "speaker": "Opportunité 1",
      "date": "Nous recherchons des profils / CVs ...",
      "subject": "www.opportunities.com",
    },
    {
      "speaker": "Opportunité 2",
      "date": "Nous sommes à la recherche d’une Chargée  ...",
      "subject": "www.share.com",
    },
    {
      "speaker": "Opportunité 3",
      "date": "les sites internet spécialisés ou sur les ...",
      "subject": "www.reseau.com",
    },
  ];

class _EnterprisePageState extends State<EnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "Opportunités",
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
              leading: Icon(Icons.share),
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
