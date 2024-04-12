import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import '../auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enterprisePage.dart';

class AddRessource extends StatefulWidget {
  const AddRessource({super.key});

  @override
  State<AddRessource> createState() => _AddRessourceState();
}

class _AddRessourceState extends State<AddRessource> {
  bool loading = false;
  TextEditingController _documentComtroller = TextEditingController();
  TextEditingController _nameComtroller = TextEditingController();
  TextEditingController _descriptionComtroller = TextEditingController();
  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple:
            false); // Set allowMultiple to true for picking multiple files

    if (result != null) {
      final platformFile = result.files.first;
      if (platformFile != null) {
        final file = File(platformFile.path!);
        return file;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: "Partager une ressource", goBack: true),
      ),
      backgroundColor: Color(0xFFe3ecf1),
      endDrawer: AppDrawer(),
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
                    "Partager une ressource",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                      hintText: "Nom",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Nom de la resource",
                      labelStyle: TextStyle(color: Colors.black),
                      //prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 10.0),
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Description de la ressource",
                      labelStyle: TextStyle(color: Colors.black),
                      //prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        onTap: () async {
                          final file = await pickFile();

                          if (file != null) {
                            // Do something with the picked file, e.g., display its name or upload it
                            _documentComtroller.text = file.path;
                            print('Picked file: ${file.path}');
                          } else {
                            print('No file picked.');
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Document",
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: "Ajouter un document",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.attach_file),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )),
                  ),
                  SizedBox(height: 15),
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
                              "Valider",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EnterprisePage()));
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
}
