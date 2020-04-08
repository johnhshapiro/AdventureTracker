import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/campaignview/viewmap.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/rollpage.dart';
import 'package:FARTS/campaignview/viewcampaignpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navBarItemSelected = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _campaignNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.announcement), 
      title: Text('Campaign')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('Map')
    ),
  ];
  // This is a list of the routes available to the NavBar.
  final _campaignRouteList = [
    Campaign(),
    MapView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: _buildDrawer(),
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting, //changed shifting to fixed to display navbar item text when not selected.
          selectedItemColor: Colors.amberAccent[400], 
          currentIndex: _navBarItemSelected,
          items: _campaignNavBarItems,
          onTap: _onNavBarItemTapped,
        ),
        // Unlike a stack, an indexed stack only displays one of its children widgets at a time (in this case a page widget from the routeList page list).
        body: IndexedStack(
          // See how the page that is displayed is decided by the index of the icon selected on the Navbar.
          index:_navBarItemSelected,
          children:
              _campaignRouteList, // This would normally be a children[] widget list but it just references the list we already made, 'routeList' which tells the indexed
          // stack which widget (in this case a page) to display based on the index of the button currently selected on the bottom nav bar... So if your navabr is on the first
          // button (index 0) it will pass this value to the IndexedStack's 'index:' thereby displaying the page at that index in the 'routeList' page list.
          // So after creating a new page, you can navigate to it by adding two elements: 1) An icon and a text name of the page in the 'navbarItems' list
          // which just displays items on the NavBar and 2) the name of the page class ('HomePage', 'LoginPage' etc...) in the 'routeList' list.
          // Note the index of these items in each list must match if you want the Navbar button to correspond to the correct page.
        ),
      ),
    );
  }

  // This function controls the NavBar current index.
  _onNavBarItemTapped(int index) {
    setState(() {
     _navBarItemSelected = index;
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
              leading: Icon(Icons.outlined_flag),
              title: Text('sign out'),
              onTap: () {
                setState(() {
                  AuthenticationService().signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AuthWrapper()));
                });
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
                setState(() {
                  AuthenticationService().signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RollPage()));
                });
              },
            )
          ],
        ));
  }
}
