import 'package:FARTS/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

// Relevant pages.
import 'package:FARTS/custom_scaffold.dart';
import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/campaignview/new_campaign.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/services/stream.dart';

class GameMaster extends StatefulWidget {
  GameMaster({@required this.userData});
  final UserData userData;
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
    if (widget.userData == null) {
      return Center(child: CircularProgressIndicator());
    }
    return showCorrectWidget(
        widget.userData, addLoadCampaignWidget(widget.userData.uid, context));
  }
}

Widget addLoadCampaignWidget(String uid, BuildContext context) { 
  return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('campaigns')
            .where('userId', isEqualTo: uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Campaign snapshot error ${snapshot.error}');

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return addLoadCampaignStack(context, snapshot.data);
        }),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateNewCampaign(uid)),
        );
      },
      label: Text('Create New'),
      backgroundColor: Colors.grey[500],
    ),
  );
}

Widget addLoadCampaignStack(BuildContext context, QuerySnapshot snapshotData) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Image(
        image: AssetImage('assets/realoldpaper.jpg'),
        fit: BoxFit.cover,
      ),
      ListView(
        children: snapshotData.documents.map((DocumentSnapshot document) {
          return Card(
              color: Colors.transparent,
              child: ListTile(
                title: new Text(document['name'],
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
                onTap: () {
                  print("Selected campaign: ${document.documentID}\n");
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a1, a2) =>
                          StreamProvider<CampaignModel>.value(
                        value:
                            CampaignModelStream().streamCampaignData(document),
                        child: CampaignView(),
                      ),
                      transitionsBuilder: (context, animation, a2, child) =>
                          FadeTransition(opacity: animation, child: child),
                      transitionDuration: Duration(milliseconds: 800),
                    ),
                  );
                },
              ));
        }).toList(),
      ),
    ],
  );
}
