import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/rollpage.dart';
import 'package:FARTS/selectmodepage.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:FARTS/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

class CustomScaffold extends StatefulWidget {
  final bool nabVar;
  final bool appBarVis;
  final routeList;
  final navBarItems;
  final Widget body;

  CustomScaffold(
      {this.routeList,
      this.navBarItems,
      this.body,
      this.nabVar = false,
      this.appBarVis = true});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState(
      this.routeList, this.navBarItems, this.body, this.nabVar);
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final bool nabVar;
  final body;
  final routeList;
  final navBarItems;
  int navBarItemSelected = 0;

  _CustomScaffoldState(
      this.routeList, this.navBarItems, this.body, this.nabVar);

  // This can and should be changed to a regular key, global keys are very expensive.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        primary: true,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        endDrawer: (widget.appBarVis == false) ? null : BuildDrawer(context),
        appBar: _buildAppBar(),

        // Wont show the navbar if routeList and navBarItems parameters are null
        bottomNavigationBar:
            (nabVar != false) ? buildBottomNavigationBar() : null,

        // Shows a single page passed in as body paramter, OR multiple pages if body is null and navbar paramters are present.
        body: (nabVar == false)
            ? body
            : BuildIndexedStack(navBarItemSelected, routeList),
      ),
    );
  }

  buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .shifting, //change shifting to fixed to display navbar item text when not selected.
      selectedItemColor: Colors.amberAccent[400],
      currentIndex: navBarItemSelected,
      items: navBarItems,
      onTap: _onNavBarItemTapped,
    );
  }

  _onNavBarItemTapped(int index) {
    setState(() {
      navBarItemSelected = index;
    });
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        actions: <Widget>[
          Padding(
            key: Key('AppPad'),
            padding: const EdgeInsets.all(9.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
        ]);
  }
}

class BuildIndexedStack extends StatelessWidget {
  final int navBarItemSelected;
  final List<Widget> routeList;
  const BuildIndexedStack(this.navBarItemSelected, this.routeList);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: navBarItemSelected,
      children: routeList,
    );
  }
}

class BuildDrawer extends StatefulWidget {
  final BuildContext context;
  BuildDrawer(this.context);

  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Drawer(
        elevation: 20.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName:
                  Text('username', style: TextStyle(color: Colors.black87)),
              accountEmail: Text('user_name@gmail.com',
                  style: TextStyle(color: Colors.black87)),
              currentAccountPicture: Image.asset("assets/user.png"),
              decoration: BoxDecoration(color: Colors.amber),
            ),
            ListTile(
              key: Key('Settings'),
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // This line code will close drawer programatically....
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            Divider(height: 2.0),
            ListTile(
              key: Key('Mode'),
              leading: Icon(Icons.mode_edit),
              title: Text('Mode'),
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamProvider<UserData>.value(
                              value: DatabaseService(uid: user.uid).userData,
                              child: SelectModePage())));
                });
              },
            ),
            Divider(height: 2.0),
            ListTile(
              key: Key('SignOut'),
              leading: Icon(Icons.outlined_flag),
              title: Text('Sign Out'),
              onTap: () {
                setState(() {
                  AuthenticationService().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AuthWrapper()),
                      (r) => false);
                });
              },
            ),
            Divider(height: 2.0),
            ListTile(
              key: Key('DiceBag'),
              leading: Icon(Icons.casino),
              title: Text('Dice Bag'),
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RollPage()));
                });
              },
            ),
          ],
        ));
  }
}
