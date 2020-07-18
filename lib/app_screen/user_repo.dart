import 'package:firebase_auth/firebase_auth.dart';

class UserRepo{
  final FirebaseAuth _firebaseAuth;
  UserRepo({FirebaseAuth firebaseAuth})
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signinwithemailandpwd(String email,String pwd){
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: pwd);
  }

  Future<void> signup(String email,String pwd) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pwd);
  }

  Future<void> signout() async{
    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async{
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<FirebaseUser> getUser() async{
    return await _firebaseAuth.currentUser();
  }
}