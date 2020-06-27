import 'package:firebase_auth/firebase_auth.dart';

import 'package:kbgapp/modules/customers.dart';
import 'database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  Customer _userFromFirebaseUser(FirebaseUser customer) {
    return customer != null ? Customer(uid: customer.uid) : null;
  }

  //auth change user stream
  Stream<Customer> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // same
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign-up with e-mail and password
  Future signUpEmail(String email, String password)  async{
    try{
        AuthResult result = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
        return null;
    }
  }

  //sign-in with e-mail and password
  Future signInEmail (String email, String password) async{
    try{
      AuthResult result = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
        return null;
    }
  }

  // delete account
  Future deleteUser(String email, String password) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      AuthCredential credentials = EmailAuthProvider.getCredential(email: email, password: password);
      print(user);
      AuthResult result = await user.reauthenticateWithCredential(credentials);
      await DatabaseService(uid: result.user.uid).deleteUser(); // called from database class
      await result.user.delete();
      return true;
    } catch (e) {
       print(e.toString());
       return null;
    }
  }

}