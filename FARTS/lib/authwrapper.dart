import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/models/user.dart';
import 'package:FARTS/loginpage.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // This user info can be used to access user specific data
    final user = Provider.of<User>(context);
    if (user != null) {
      return StreamProvider<UserData>.value(
        value: DatabaseService(uid: user.uid).userData,
        child: showCorrectPage(user)); 
    }

    // return either loginpage or homepage, depending on whether user is signed in
    return showCorrectPage(user);
  }

  Widget showCorrectPage(User user) {
    if (user == null) {
      return LoginPage();
    } else {
      return SelectModePage();
    }
  }
}