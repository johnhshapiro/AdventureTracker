import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';

// Relevant pages.
import 'package:FARTS/campaignview/encounter_view.dart';
import 'package:FARTS/campaignview/campaign_info.dart';
import 'package:FARTS/campaignview/map_view.dart';
import 'package:FARTS/campaignview/party_view.dart';

const campaignNavBarItems = [
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

final campaignRouteList = [Campaign(), MapView(), PartyView(), EncounterView()];

class CampaignView extends StatefulWidget {
  final bool route;
  CampaignView({this.route = true});
  @override
  _CampaignViewState createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
  // This is a list of the routes available to the NavBar.

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        nabVar: true,
        routeList: widget.route == true ? campaignRouteList : <Widget>[],
        navBarItems: campaignNavBarItems);
  }
}
