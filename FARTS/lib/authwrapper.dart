import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either loginpage or homepage, depending on whether user is signed in
    return LoginPage();
  }
}