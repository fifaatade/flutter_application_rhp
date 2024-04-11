import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_rhp/views/auth/signUp.dart';
import 'package:flutter_application_rhp/views/beneficiaire/benef.dart';
import 'package:flutter_application_rhp/views/beneficiaire/inscriptionBenef.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../home.dart';

class ConnBenef extends StatefulWidget {
  const ConnBenef({super.key});

  @override
  State<ConnBenef> createState() => _ConnBenefState();
}

class _ConnBenefState extends State<ConnBenef> {
  bool loading = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool pswObscure = true;


  @override
  Widget build(BuildContext context) {
 return Scaffold(
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
                      "Connexion bénéficiaire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Kanit"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Veuillez entrer votre mail et votre password! ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.person),
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
                                      "Se connecter",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: _signInB),
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
  void _signInB() async {
    setState(() {
      loading = true;
    });
    String email = _emailController.text;

    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      loading = false;
    });
    if (user != null) {
      print("User is successfully created");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Benef()),
        (route) => false,
      );
    } else {
      print("Something went wrong");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Identifiant ou mot de passe incorrecte"),
        ),
      );
    }
  }
}

