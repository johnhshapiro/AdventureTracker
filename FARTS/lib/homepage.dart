import 'package:flutter/material.dart';

import './main.dart';
import './loginpage.dart';
import './selectmodepage.dart';
import './createnewuserpage.dart';

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