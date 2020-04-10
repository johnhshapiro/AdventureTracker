import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(BoardsEdge());
//   SystemChrome.setEnabledSystemUIOverlays([]);
// }

class CustomScaffold extends StatefulWidget {
  final routeList;
  final navBarItems;

  //final Widget floatingActionButton;
  CustomScaffold(
      {this.routeList, this.navBarItems/*this.floatingActionButton*/});
  @override
  _CustomScaffoldState createState() =>
      _CustomScaffoldState(this.routeList, this.navBarItems/*floatingActionButton*/);
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final routeList;
  final navBarItems;
  int navBarItemSelected=0;
  //final Widget floatingActionButton;
  _CustomScaffoldState(
      this.routeList, this.navBarItems/*this.floatingActionButton*/);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final navBar = _buildBottomNavigationBar();
    final routeStack = _buildIndexedStack();
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
        bottomNavigationBar: navBar,
        body: routeStack,
        //floatingActionButton: floatingActionButton,
      ),
    );
  }

    _buildIndexedStack() {
    return IndexedStack(
          index: navBarItemSelected,
          children: routeList,
        );
  }
  
  _buildBottomNavigationBar() {
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
