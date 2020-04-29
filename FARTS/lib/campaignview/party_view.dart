import 'package:FARTS/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyView extends StatefulWidget {
  @override
  _PartyViewState createState() => _PartyViewState();
}

class _PartyViewState extends State<PartyView> {
  var _campaignModelStream;

  @override
  Widget build(BuildContext context) {
    // Initializes the stream of data for this specifici campaign, mapped from firestore to the local CampaignModel
    _campaignModelStream = Provider.of<CampaignModel>(context);
    if (_campaignModelStream == null){
      return Center(child: CircularProgressIndicator(),);
    } else {
    }
  }
}

Widget partyViewWidget(CampaignModel campaign) {
  return Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/realoldpaper.jpg'),
            fit: BoxFit.fill,
          ),
          ListView.builder(
              itemCount: campaign.party.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Text("Lvl Class Name",
                        style: TextStyle(fontSize: 12.0, color: Colors.black)),
                    title: Text(campaign.party[index],
                        style: TextStyle(color: Colors.black)),
                    onTap:
                        () {}, // TODO navigate to the corresponding characterpage (index can be used to retrieve the chars like 'where(DBreference = index) ....showcharacter...)
                  ),
                );
              }),
        ],
      ));
}