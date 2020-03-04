import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthenticationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
      try {
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return user;
      } catch (e) {
        return null;
      }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<FirebaseUser> get user {
  // This stream is used to check state changes in authorization
    return _auth.onAuthStateChanged;
  }
}

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();  
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: MaterialButton(
          child: Text('Sign out'),
          onPressed: () {
            AuthenticationService().signOut();
          })
      ),
    );
  }
}