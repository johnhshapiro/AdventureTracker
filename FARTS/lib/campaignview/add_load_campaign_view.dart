import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

// Relevant pages.
import 'package:FARTS/custom_scaffold.dart';
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/services/stream.dart';

class GameMaster extends StatefulWidget {
  @override
  _GameMasterState createState() => _GameMasterState();
}

class _GameMasterState extends State<GameMaster> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _buildAddLoadCampaignBody(context),
    );
  }

  Widget _buildAddLoadCampaignBody(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return showCorrectWidget(user, addLoadCampaignWidget(user));
  }
}

Widget addLoadCampaignWidget(UserData user) {
  return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('campaigns')
              .where('userId', isEqualTo: user.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Campaign snapshot error ${snapshot.error}');

            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/realoldpaper.jpg'),
                  fit: BoxFit.cover,
                ),
                ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Card(
                        color: Colors.transparent,
                        child: ListTile(
                          title: new Text(document['name'],
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black)),
                          onTap: () {
                            print(
                                "Selected campaign: ${document.documentID}\n");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StreamProvider<CampaignModel>.value(
                                  value: CampaignModelStream()
                                      .streamCampaignData(document.documentID),
                                  child: CampaignView(),
                                ),
                              ),
                            );
                          },
                        ));
                  }).toList(),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Create New'),
        backgroundColor: Colors.grey[500],
      ),
    );
}