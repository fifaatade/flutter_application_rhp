import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/appDrawerBenef.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';

class CoachingList extends StatefulWidget {
  const CoachingList({super.key});

  @override
  State<CoachingList> createState() => _CoachingListState();
}

class _CoachingListState extends State<CoachingList> {
  @override
    final events = [
    {
      "speaker": "Coaching 1",
      "date": "27 Avril 2024 10h",
      "subject": "Coach Paul",
    },
    {
      "speaker": "Coaching 2",
      "date": "16 Avril 2024 12h",
      "subject": "Coach Méchak",
    },
    
  ];
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "Coaching",
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
              leading: Icon(Icons.video_call_outlined),
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