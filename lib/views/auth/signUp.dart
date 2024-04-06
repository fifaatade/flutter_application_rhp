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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Inscription",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/logo.png",
            color: Colors.purple,
            ),
            Text(
                "Veuillez remplir les champs pour vous inscrire!",
                style: TextStyle(color: Colors.grey,),
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
            TextField(
              controller: _confirmController,
              obscureText: confpswObscure,
              decoration: InputDecoration(
                hintText: "Confirmez votre mot de passe ",
                labelText: "Confirmation",
                prefixIcon: Icon(Icons.lock),
                suffix: InkWell(
                  child: Icon(
                    confpswObscure ? Icons.visibility : Icons.visibility_off,
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
            loading? Center(child: CircularProgressIndicator()) : ElevatedButton(child: Text("S'inscrire"), onPressed: _signUp),
            SizedBox(height: 10),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Vous avez déjà un compte ? Connectez-vous",
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
 

