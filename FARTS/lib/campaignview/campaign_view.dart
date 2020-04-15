import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/campaignview/encounter_view.dart';
import 'package:FARTS/campaignview/campaign_info.dart';
import 'package:FARTS/campaignview/map_view.dart';
import 'package:FARTS/campaignview/party_view.dart';
import 'package:provider/provider.dart';

class CampaignView extends StatefulWidget {
  
  @override
  _CampaignViewState createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
  
  final _campaignNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.announcement),
      title: Text('Campaign'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('Map'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text('Party'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.error),
      title: Text('Encounters'),
    ),
  ];
  // This is a list of the routes available to the NavBar.
  
  @override
  Widget build(BuildContext context) {
    final _campaignRouteList = [Campaign(), MapView(), PartyView(), EncounterView()];
    return CustomScaffold(
        routeList: _campaignRouteList, navBarItems: _campaignNavBarItems);
  }
}
