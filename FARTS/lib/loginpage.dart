import 'package:FARTS/selectmodepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import './main.dart';
import './homepage.dart';
import './createnewuserpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // the next two lines are for authentification
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack stacks multiple children widgets (Image, and Column which in turn has many children itself) in a space.
        fit: StackFit
            .expand, // Note 'fit' here is a property of the body Stack making the image expand to fill the display.
        children: <Widget>[
          Image(
              image: AssetImage("assets/loginImage.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87, // The number here is the opacity.
              colorBlendMode: BlendMode
                  .luminosity // Blends the background color with the background image.
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // For column, main axis alignment will always be vertically aligned (row = horizontal for main axis)
            children: <Widget>[
              Form(
                key: _formKey, // this is the key for authentification
                child: Theme(
                  // This theme is wrapping the entire Column child which displays all the text fields, allowing the forms to have their own speerate theme (brighter than the background)
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                              color: Colors.grey[200], fontSize: 20.0))),
                  child: Container(
                    // This container is also wrapping the next column widget to enable padding (and whatver else we want for layout)
                    padding: const EdgeInsets.all(40.00),
                    child: Column(
                      // Entering column as a child here allows for multiple forms.
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          key: new Key('email'),
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Email",
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // This is just telling it to pull up the right keyboard type for an email address
                          // email validation
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                          onChanged: (input) => _email = input,
                        ),
                        TextFormField(
                          key: new Key('password'),
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          // password validation
                          validator: (value) {
                            if (value.isEmpty || value.length < 6) {
                              return 'Password is blank or less than 6 characters';
                            }
                            return null;
                          },
                          onChanged: (input) => _password = input,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        Builder(
                          builder: (context) => MaterialButton(
                            color: Colors.grey[800],
                            child: Text("Sign In"),
                            onPressed: () async {
                              HapticFeedback.heavyImpact();
                              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Signing in'),));
                              if (_formKey.currentState.validate()) {
                                try {
                                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SelectModePage()),
                                  );
                                } catch (e) {
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password"),));
                                  print(e.message);
                                }
                              }
                            },
                            splashColor: Colors
                                .amber, //Creates the color splash when u press the button. By u do u mean me?
                          ),
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          child: Text("New User"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateNewUser()),
                            );
                          },
                          splashColor: Colors
                              .amber, //Creates the color splash when u press the button.
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          child: Text("Dev Bypass"),
                          onPressed: () {
                            HapticFeedback.heavyImpact();
                            Navigator.push(
                              context,
                                MaterialPageRoute(
                                  builder: (context) => SelectModePage()
                                ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}