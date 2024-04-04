import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Something went wrong ");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Something went wrong ");
    }
    return null;
  }
  
}
