import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:get/get.dart';
import '../home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  bool pswObscure = true;
  bool confpswObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

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
                      "Inscription",
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
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "Enteprise/Organisme",
                        labelText: "Nom de l'organisme/enteprise",
                        prefixIcon: Icon(Icons.person),
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
                                      "S'inscrire",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: _signUp),
                              ),
                            ],
                          ),
                    SizedBox(height: 10),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          // Lorsque le texte est tapé, naviguer vers la page de connexion
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text.rich(TextSpan(
                            text: "Vous avez déjà un compte ?",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                            children: [
                              TextSpan(
                                text: " Connectez-vous",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                      ),
                    ),
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

    String username = _usernameController.text;

    String email = _emailController.text;

    String password = _passwordController.text;

    String confirm = _confirmController.text;

    if (password == confirm) {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User is successfully created");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
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
