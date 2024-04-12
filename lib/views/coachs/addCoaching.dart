import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/appDrawerCoach.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import 'package:flutter_application_rhp/views/coachs/coach.dart';

class AddCoaching extends StatefulWidget {
  const AddCoaching({super.key});

  @override
  State<AddCoaching> createState() => _AddCoachingState();
}

class _AddCoachingState extends State<AddCoaching> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: "Partager une ressource", goBack: true),
      ),
      backgroundColor: Color(0xFFe3ecf1),
      endDrawer: AppDrawerCoach(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ajouter un coaching",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                   TextField(
                      onTap: () {
                        _showPickerDialog(
                          context,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Date d'anniversaire",
                        labelText: "anniversaire",
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: "Nom",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Nom du bénéficiaire",
                      labelStyle: TextStyle(color: Colors.black),
                      //prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 22),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(
                              "Ajouter",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>Coach ()));
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  
  }

    Future<void> _showPickerDialog(
    BuildContext context,
  ) async {
    Locale myLocale = Localizations.localeOf(context);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary:
                  Colors.blue, // Couleur du texte dans le sélecteur de date
              onPrimary: Colors.white, // Couleur de fond du sélecteur de date
            ),
          ),
          child: child!,
        );
      },
    );
  }
}