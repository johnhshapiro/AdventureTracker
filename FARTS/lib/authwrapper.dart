import 'package:FARTS/selectmodepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FARTS/characters/user_model.dart';
import 'package:FARTS/services/database.dart';

import 'loginpage.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This user info can be used to access user specific data
    final user = Provider.of<User>(context);

    // return either loginpage or homepage, depending on whether user is signed in
    return showCorrectPage(user);
  }

  Widget showCorrectPage(User user) {
    if (user != null) {
      return StreamProvider<UserData>.value(
        value: DatabaseService(uid: user.uid).userData,
        child: SelectModePage()); 
    } else {
      return LoginPage();
    }
  }
}
