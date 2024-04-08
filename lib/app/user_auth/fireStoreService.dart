/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String collectionName = "users";

  Future<void> addData(Map<String, dynamic> data) async {
    try {
      // Add a new document with a generated ID
      await _firestore.collection(collectionName).add(data);
      print("Data added successfully!");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  // Example usage:
  Future<void> saveUserData(String name, String email) async {
    final data = {
      "name": name,
      "email": email,
      // Add other fields as needed
    };
    await addData(data);
  }
}
 */
