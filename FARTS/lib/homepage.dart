import 'package:FARTS/viewcampaignpage.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import './loginpage.dart';
import './createnewuserpage.dart';
import 'package:FARTS/rollpage.dart';
import 'package:FARTS/viewcampaignpage.dart';
import 'package:FARTS/selectmodepage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  
  // This var keeps track fo the bottom NavBar's current index selection.
  int _selectedIndex = 0;
  // This is a list of the NavBar icons/items, note it could also be something other than a NavBar
  // item though like a Widget
  final navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home), title: Text('Login')),
    BottomNavigationBarItem(
      icon: Icon(Icons.subtitles), title: Text('Mode')),
    BottomNavigationBarItem(
      icon: Icon(Icons.announcement), title: Text('Campaign')),
    BottomNavigationBarItem(
        icon: Icon(Icons.chrome_reader_mode), title: Text('Logout')),
  ];
  // This is a list of the routes available to the NavBar.
  final _routeList = [
    LoginPage(),
    SelectModePage(),
    Campaign(),
    Logout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: navBarItems,
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped),
        // Unlike a stack, an indexed stack only displays one of its children widgets at a time (in this case a page widget from the routeList page list).
        body: IndexedStack(
          // See how the page that is displayed is decided by the icon selected on the Navbar.
          index: _selectedIndex,
          children: _routeList, // This would normally be a children[] widget list but it just references the list we already made, 'routeList' which tells the indexed
          // stack which widget (in this case a page) to display based on the index of the button currently selected on the bottom nav bar... So if your navabr is on the first 
          // button (index 0) it will pass this value to the IndexedStack's 'index:' thereby displaying the page at that index in the 'routeList' page list.
          // So after creating a new page, you can navigate to it by adding two elements: 1) An icon and a text name of the page in the 'navbarItems' list
          // which just displays items on the NavBar and 2) the name of the page class ('HomePage', 'LoginPage' etc...) in the 'routeList' list.
          // Note the index of these items in each list must match if you want the Navbar button to correspond to the correct page.
        ));
  }

  // This function controls the NavBar current index.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}


