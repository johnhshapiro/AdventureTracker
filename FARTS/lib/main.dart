import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './selectmodepage.dart';

void main() => runApp(BoardsEdge());
/*Loads 'main' as a Widget, even the app itself is a Widget. '=>' AKA 'fat arrow' in Dart 
is the single line lambda function syntax for the language. Pretty cool.  */

class BoardsEdge extends StatelessWidget {
  // This is the root Widget (Class).

  // This is a test variable for a unit test demo in FARTS/test/main_test.dart 
  final int unitTestVar = 0;

  @override
  Widget build(BuildContext context) {
    // 'build' is the equivalent of a constructor for a class (note its also a widget like everything)
    return MaterialApp(
        home: LoginPage(), // Sets the login page as the home page.
        theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.dark,
            primaryColor: Colors.grey[800],
            accentColor: Colors.amber,

            // Define default font family
            fontFamily: 'Georgia',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines (headline5), titles (headline6), bodies of text (bodyText2), and more.
            // *NOTE* if you are seeing red underline for the textTheme variables you need to update flutter/dart
            textTheme: TextTheme(
              headline5: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Georgia')
            ),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              color: Colors
                  .black87, // The number here is the opacity.
              colorBlendMode: BlendMode.luminosity // Blends the background color with the background image.
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // For column, main axis alignment will always be vertically aligned (row = horizontal for main axis)
            children: <Widget>[
              Form(
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
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Username",
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // This is just telling it to pull up the right keyboard type for an email address
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top:
                                  40.0),
                        ),
                        // TODO: make the button check user credentials. Right now it just logs in no matter what
                        MaterialButton(
                          color: Colors.grey[800],
                          child: Text("Login"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          splashColor: Colors
                              .amber, //Creates the color splash when u press the button.
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
                          // Doesn't do anything right now but will link to the create user page!
                          splashColor: Colors
                              .amber, //Creates the color splash when u press the button.
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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This is a list of the NavBar icons/items, note it could also be something other than a NavBar
  // item though like a Widget
  final navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('login')),
    BottomNavigationBarItem(icon: Icon(Icons.subtitles), title: Text('mode')),
    BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode), title: Text('create user')),
    BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode), title: Text('create user')),
  ];
  // This is a list of the routes available to the NavBar.  
  final routeList = [LoginPage(), SelectModePage(), CreateNewUser(), CreateNewUser()];

  // This function and variable are for the NavBar.
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
    _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: navBarItems,
      currentIndex: _selectedIndex, 
      onTap: _onItemTapped
      ),
      // Unlike a stack, an indexed stack only displays one of its children widgets at a time (in this case a page widget).
      body: IndexedStack(
        // See how the page that is displayed is decided by the icon selected on the Navbar.
        index: _selectedIndex,
        children: routeList,
      ));
  }
}

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
              color: Colors
                  .black87, // The number here is the opacity.
              colorBlendMode: BlendMode.luminosity // Blends the background color with the background image.
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
                      decoration: InputDecoration(
                        labelText: "Username"
                      ),
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
                        if (value.isEmpty || value.length < 8 ) {
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
                          return 'Password Doesn''\'t Match';
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),
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
