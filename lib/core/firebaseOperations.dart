import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ogr_takip/registerPage.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User get currentUser => _auth.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//sign in
  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

// register
  Future<User> createUser(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

switch (dropdownValue) {
      case 'Öğrenci':
        await _firestore.collection('Öğrenciler').doc(user.user.uid).set({
          'userName': name,
          'email': email,
        });
        break;
      case 'Öğretmen':
        await _firestore.collection('Öğretmenler').doc(user.user.uid).set({
          'userName': name,
          'email': email,
        });
        break;
      default:
    }
    
    return user.user;
  }
}
