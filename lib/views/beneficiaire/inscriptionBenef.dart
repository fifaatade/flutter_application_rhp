import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rhp/components/app_drawer.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:flutter_application_rhp/views/beneficiaire/connBenef.dart';
import 'package:get/get.dart';
import '../home.dart';

class InscriptionBenef extends StatefulWidget {
  const InscriptionBenef({super.key});

  @override
  State<InscriptionBenef> createState() => _InscriptionBenefState();
}

class _InscriptionBenefState extends State<InscriptionBenef> {
  bool loading = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  bool pswObscure = true;
  bool confpswObscure = true;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _birthdayController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: "Ajout de bénéficiaire",
          goBack: true,
          colr: Color(0xFF0a3622),
        ),
      ),
      endDrawer: AppDrawer(),
      backgroundColor: Color(0xFF0a3622),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Container(
                //decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(15)),
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      "Ajouter un bénéficiaire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Kanit"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Veuillez remplir les champs pour vous inscrire!",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _firstnameController,
                      decoration: InputDecoration(
                        hintText: "Nom",
                        labelText: "Nom",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        hintText: "Prénom",
                        labelText: "Prénom",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _birthdayController,
                      decoration: InputDecoration(
                        hintText: "Date d'anniversaire",
                        labelText: "anniversaire",
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: " Email",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: pswObscure,
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        labelText: "Votre mot de passe",
                        prefixIcon: Icon(Icons.lock),
                        suffix: InkWell(
                          child: Icon(
                            pswObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onTap: () {
                            setState(() {
                              pswObscure = !pswObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _confirmController,
                      obscureText: confpswObscure,
                      decoration: InputDecoration(
                        hintText: "Confirmez votre mot de passe ",
                        labelText: "Confirmation",
                        prefixIcon: Icon(Icons.lock),
                        suffix: InkWell(
                          child: Icon(
                            confpswObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onTap: () {
                            setState(() {
                              confpswObscure = !confpswObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    loading
                        ? Center(child: CircularProgressIndicator())
                        : Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 22),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Text(
                                      "Enrégistrer un Bénéficiaire",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: _signUp),
                              ),
                            ],
                          ),
                    SizedBox(height: 10),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      loading = true;
    });

    String firstname = _firstnameController.text;

    String lastname = _lastnameController.text;

    String birthday = _birthdayController.text;

    String email = _emailController.text;

    String password = _passwordController.text;

    String confirm = _confirmController.text;

    if (password == confirm) {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User is successfully created");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ConnBenef()),
          (route) => false,
        );
      } else {
        print("Something went wrong");
      }
    }
    setState(() {
      loading = false;
    });
  }
}
