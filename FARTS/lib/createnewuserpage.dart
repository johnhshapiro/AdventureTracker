import 'package:flutter/material.dart';

import './homepage.dart';

class CreateNewUser extends StatefulWidget {
  @override
  _CreateNewUserState createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
  final _formkey = GlobalKey<FormState>();
  String _pwCheck;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87, // The number here is the opacity.
              colorBlendMode: BlendMode
                  .luminosity // Blends the background color with the background image.
              ),
          Form(
            key: _formkey,
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  backgroundColor: Colors.black,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.grey[200], fontSize: 20.0))),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      // Username
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Must Be At Least 4 Characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    TextFormField(
                      // Email
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      // Password
                      validator: (value) {
                        _pwCheck = value;
                        if (value.isEmpty || value.length < 8) {
                          return 'Must be at least 8 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    TextFormField(
                      // Confirm Password
                      validator: (value) {
                        if (value.isEmpty || value != _pwCheck) {
                          _pwCheck = null;
                          return 'Password Doesn' '\'t Match';
                        }
                        _pwCheck = null;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    MaterialButton(
                      color: Colors.grey[800],
                      child: Text("Create"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Checking Fields'))); TODO fixme show snackbar 'Checking Fields' on the press of create user
                          SnackBar(content: Text('c'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                      splashColor: Colors
                          .amber, //Creates the color splash when u press the button.
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
