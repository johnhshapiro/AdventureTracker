import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      //backgroundColor: Colors.black,
      body: Stack(
        // This is a 'Stack' type because it has multiple children elements (Image, and Column which in turn has many children itself)
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
                            labelText: "Username",
                          ),
                          keyboardType: TextInputType
                              .emailAddress, // This is just telling it to pull up the right keyboard type for an email address
                        ),
                        TextFormField(
                          decoration: InputDecoration(
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
  // This index keeps track of the current item selected on the bottom NavBar.
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Sheets', style: optionStyle),
    Text('Index 2: Rules', style: optionStyle),
    Text('Index 3: Spells', style: optionStyle),
    Text('Index 4: Profile', style: optionStyle)
  ];

  // This function is for the NavBar.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      if (_selectedIndex == 1) {
        // TODO add a route for the sheets page here.
      }
      if (_selectedIndex == 2) {
        // TODO add a route for the rules page here.
      }
      if (_selectedIndex == 3) {
        // TODO add a route for the spells page here.
      }
      if (_selectedIndex == 4) {
        // TODO add a route for the profile page here.
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Form(child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                    },
                    child: Text('Game Master'),
                    color: Colors.grey[800],
                    splashColor: Colors.amber,
                  ),
                  MaterialButton(
                    onPressed: () {
                    },
                    child: Text('Adventurer'),
                    color: Colors.grey[800],
                    splashColor: Colors.amber,
                  ),
                ],
              ),
            )),
          ],)
        ],),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subtitles),
            title: Text('Sheets'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Rules'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Spells'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[600],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CreateNewUser extends StatefulWidget {
  @override
  _CreateNewUserState createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
final _formkey = GlobalKey<FormState>();
var _pwCheck;

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
                          return 'Password Doesn''\'t Match';
                        }
                        _pwCheck = 'fuck you';
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
