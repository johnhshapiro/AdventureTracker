import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(BoardsEdge());
//   SystemChrome.setEnabledSystemUIOverlays([]);
// }

class CustomScaffold extends StatefulWidget {
  final Widget bottomNavigationBar;
  final Widget body;
  final Widget floatingActionButton;
  CustomScaffold(
      {this.bottomNavigationBar, this.body, this.floatingActionButton});
  @override
  _CustomScaffoldState createState() =>
      _CustomScaffoldState(bottomNavigationBar, body, floatingActionButton);
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final Widget bottomNavigationBar;
  final Widget body;
  final Widget floatingActionButton;
  _CustomScaffoldState(
      this.bottomNavigationBar, this.body, this.floatingActionButton);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        primary: true,
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        endDrawer: _buildDrawer(),
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
        ]);
  }

  _buildDrawer() {
    return Drawer(
        elevation: 20.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:
                  Text('User name', style: TextStyle(color: Colors.black87)),
              accountEmail: Text('user_name@gmail.com',
                  style: TextStyle(color: Colors.black87)),
              currentAccountPicture: Image.asset("assets/user.png"),
              decoration: BoxDecoration(color: Colors.amberAccent),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // This line code will close drawer programatically....
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.mode_edit),
              title: Text('mode'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.outlined_flag),
              title: Text('sign out'),
              onTap: () {
                setState(() {
                  AuthenticationService().signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthWrapper()));
                });
              },
            )
          ],
        ));
  }
}
