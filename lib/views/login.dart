import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_rhp/views/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Connexion",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/logo.png",
              color: Colors.purple,
            ),
            Text("Veuillez entrer votre mail et votre password! ",
            style: TextStyle(color: Colors.grey,),
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
                    pswObscure ? Icons.visibility : Icons.visibility_off,
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
            loading? Center(child: CircularProgressIndicator()) : 

            ElevatedButton(child: Text("Se connecter"), onPressed: _signIn),
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
                child: Text(
                  "Vous n'avez pas de compte ? Inscrivez-vous",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
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
        MaterialPageRoute(builder: (context) => const Home()),
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
