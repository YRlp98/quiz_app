import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/models/f_user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Accept firebase user as a user
  FUser _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? FUser(uId: user.uid) : null;
  }

  // Sign up function
  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign in function
  signInEmailAndPass(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Sign out function
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
