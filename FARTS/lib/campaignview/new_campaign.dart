import 'package:FARTS/campaignview/add_load_campaign_view.dart';
import 'package:FARTS/custom_scaffold.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class CreateNewCampaign extends StatefulWidget {
  String userId; // should look at using @required but running into some issues
  CreateNewCampaign(String uid){
    this.userId = uid;
  }
  
  
  @override
  _CreateNewCampaignState createState() => _CreateNewCampaignState();  
}

class _CreateNewCampaignState extends State<CreateNewCampaign> {
  final _formkey = GlobalKey<FormState>();
  final CollectionReference campaignCollection = Firestore.instance.collection('campaigns');
  String _campaignName = '';
  String user;
  @override
  Widget build(BuildContext context){
    return CustomScaffold(
      body: buildCampaignWidget(context),
      );
  }

  Widget buildCampaignWidget(BuildContext context){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
      Image(
        image: AssetImage('assets/realoldpaper.jpg'),
        fit: BoxFit.cover,
      ),
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
                padding: const EdgeInsets.all(50.0),
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
                          createCampaign(_campaignName, widget.userId);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => addLoadCampaignWidget(widget.userId, context)));
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
    await campaignCollection.document() //document has random id
    .setData({//some values hard coded as it is assumed they will be changed later
      'name': name,
      'notes': 'new campaign',
      'encounter_test': ["encounter 1", "encounter 2"],
      'party_test': ["Shrek","character 2"],
      'map_name': "Map",
      'userId': uid //always store passed user id
    });
  }

}