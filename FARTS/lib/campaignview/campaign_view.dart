import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:FARTS/campaignview/map_view.dart';
import 'package:FARTS/campaignview/party_view.dart';
import 'package:FARTS/services/authentication.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/rollpage.dart';
import 'package:FARTS/campaignview/campaign_info.dart';

class CampaignView extends StatefulWidget {
  CampaignView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CampaignViewState createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
  int _navBarItemSelected = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _campaignNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.announcement), title: Text('Campaign')),
    BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Map')),
    BottomNavigationBarItem(icon: Icon(Icons.group), title: Text('Party')),
  ];
  // This is a list of the routes available to the NavBar.
  final _campaignRouteList = [Campaign(), MapView(), PartyView()];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(routeList: _campaignRouteList, navBarItems: _campaignNavBarItems);
  }

  // This function controls the NavBar current index.
  _onNavBarItemTapped(int index) {
    setState(() {
      _navBarItemSelected = index;
    });
  }

  _buildIndexedStack() {
    return IndexedStack(
          // See how the page that is displayed is decided by the index of the icon selected on the Navbar.
          index: _navBarItemSelected,
          children:
              _campaignRouteList, // This would normally be a children[] widget list but it just references the list we already made, 'routeList' which tells the indexed
          // stack which widget (in this case a page) to display based on the index of the button currently selected on the bottom nav bar... So if your navabr is on the first
          // button (index 0) it will pass this value to the IndexedStack's 'index:' thereby displaying the page at that index in the 'routeList' page list.
          // So after creating a new page, you can navigate to it by adding two elements: 1) An icon and a text name of the page in the 'navbarItems' list
          // which just displays items on the NavBar and 2) the name of the page class ('CampaignView', 'LoginPage' etc...) in the 'routeList' list.
          // Note the index of these items in each list must match if you want the Navbar button to correspond to the correct page.
        );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .shifting, //change shifting to fixed to display navbar item text when not selected.
      selectedItemColor: Colors.amberAccent[400],
      currentIndex: _navBarItemSelected,
      items: _campaignNavBarItems,
      onTap: _onNavBarItemTapped,
    );
  }
}