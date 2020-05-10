import 'package:FARTS/authwrapper.dart';
import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:FARTS/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:FARTS/models/user_model.dart';
import 'package:FARTS/services/stream.dart';

class CreateNewCampaign extends StatefulWidget {
  CreateNewCampaign({@required this.userData});
  final UserData userData;
  @override
  _CreateNewCampaignState createState() => _CreateNewCampaignState();  
}

class _CreateNewCampaignState extends State<CreateNewCampaign> {
  final _formkey = GlobalKey<FormState>();
  final databaseReference = Firestore.instance;
  final CollectionReference campaignCollection = Firestore.instance.collection('campaigns');
  final CollectionReference encountersCollection = Firestore.instance.collection('encounters');
  final CollectionReference mapsCollection = Firestore.instance.collection('maps');
  String _campaignName = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Form(
            key: _formkey,
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  backgroundColor: Colors.black,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.grey[200], fontSize: 20.0))),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      key: Key('campaignName'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return 'Name must be at least 3 Characters';
                        }
                        return null;
                      },
                      onChanged: (input) => _campaignName = input,
                      decoration: InputDecoration(labelText: "Campaign Name"),
                    ),
                    Builder(
                      builder: (context) => MaterialButton(
                        key: Key('Checking Input'),
                        color: Colors.grey[900],
                        child: Text("Create Campaign"),
                        //should check if identical campaign name exists
                        onPressed:() {
                          createCampaign(_campaignName, widget.userData.uid);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => addLoadCampaignWidget(widget.userData.uid, context)));
                        },
                      ),
                    )
                  ],
                )
              )

              )
            ),
        ]
      ),
      );
    
  }

  Future createCampaign(String name, String uid) async{
    await campaignCollection.document(uid)
    .setData({
      //should auto fill to null
      'name': name,
      'notes': 'new campaign'
    });
  }

}