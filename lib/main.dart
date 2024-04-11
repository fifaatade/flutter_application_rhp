import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/views/auth/login.dart';
import 'package:flutter_application_rhp/views/auth/signUp.dart';
import 'package:flutter_application_rhp/views/connection_side.dart';
import 'package:flutter_application_rhp/views/enter_app.dart';
import 'package:flutter_application_rhp/views/home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
            tertiary: Colors.white,
            brightness: Brightness.light,
            primary: const Color(0xFF0a3622),
            onPrimary: const Color.fromARGB(255, 255, 255, 255),
            onTertiary: Colors.black,
            secondary: const Color(0xFF000E35),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black),
        appBarTheme: AppBarTheme(),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: ConnexionSide(),
    );
  }
}
