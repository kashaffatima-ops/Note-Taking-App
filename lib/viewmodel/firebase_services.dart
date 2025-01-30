import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return userCredential;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // return e.message;
      return;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      signInWithEmailAndPassword(email, password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> addNote(String userId, String title, String description) async {
    if (title.isNotEmpty && description.isNotEmpty) {
      await _firestore.collection('users').doc(userId).collection('tasks').add({
        'title': title,
        'description': description,
      });
    } else {
      throw Exception("Title and description cannot be empty.");
    }
  }

  Future<void> deleteNote(String userId, String docId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(docId)
        .delete();
  }

  Future<void> updateNote(
      String userId, String docId, String title, String description) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(docId)
        .update({
      'title': title,
      'description': description,
    });
  }
}
