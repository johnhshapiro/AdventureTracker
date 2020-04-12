import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

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
    //binding collection to ListView. source: https://pub.dev/packages/cloud_firestore
    return Scaffold(
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      Firestore.instance.collection('campaigns').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text(
                          'Campaign snapshot error ${snapshot.error}');

                    if (!snapshot.hasData) return CircularProgressIndicator();

                    return ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return Card(
                            color: Colors.grey[500],
                            child: ListTile(
                              title: new Text(document['name'],
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black)),
                              onTap: () {
                                print(document.documentID);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      StreamProvider<CampaignData>.value(
                                        value: JustDoIt().streamCampaignData(document),
                                        child: CampaignView(),
                                    ),
                                  ),
                                );
                              },
                            ));
                      }).toList(),
                    );
                  }))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Create New'),
        backgroundColor: Colors.grey[500],
      ),
    );
  }
}

// TODO: make a service class to do service tasks (like creating streams)
class JustDoIt {
  final Firestore _db = Firestore.instance;

  Stream<CampaignData> streamCampaignData(DocumentSnapshot document) {
    return _db
    .collection('campaigns')
    .document(document.documentID)
    .snapshots()
    .map((docId) => CampaignData.fromMap(docId));
  }
}

class CampaignData {
  final docId;
  CampaignData({this.docId});

  factory CampaignData.fromMap(DocumentSnapshot document) {
    return CampaignData(docId: document.documentID);
  }
}