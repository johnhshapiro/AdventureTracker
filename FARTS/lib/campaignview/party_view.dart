import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('campaigns').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text('campaign collection error ${snapshot.error}');

            if (!snapshot.hasData) return Center( child: CircularProgressIndicator());

            return ListView.builder(
                itemCount: _campaignModelStream.party.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[500],
                    child: ListTile(
                      leading: Icon(Icons.person),
                      trailing: Text("Lvl Class Name", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                      title: Text(
                           _campaignModelStream.party[index],
                          style: TextStyle(color: Colors.black)),
                      onTap:
                          () {}, // TODO navigate to the corresponding characterpage (index can be used to retrieve the chars like 'where(DBreference = index) ....showcharacter...)
                    ),
                  );
                });
          }),
    );
  }
}
