import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenang_test/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String fullname}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.updateDisplayName(fullname);
      return UserModel(id: credential.user!.uid, email: email, name: fullname);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: userCredential.user!.displayName!);
    } catch (e) {
      throw e;
    }
  }
}
