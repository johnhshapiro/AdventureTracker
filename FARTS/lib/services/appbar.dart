import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/campaignview/map_view.dart';
import 'package:FARTS/campaignview/party_view.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:FARTS/rollpage.dart';
import 'package:flutter/material.dart';

class BuildAppBar {
  dynamic scaffoldKey;
  BuildContext context;
  BuildAppBar({this.scaffoldKey, this.context});

  buildAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
        ]);
  }

  buildDrawer() {
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
              leading: Icon(Icons.outlined_flag),
              title: Text('sign out'),
              onTap: () {
                AuthenticationService().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthWrapper()));
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
              leading: Icon(Icons.casino),
              title: Text('Dice Bag'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RollPage()));
              },
            )
          ],
        ));
  }
}
