
import 'package:FARTS/campaignview/viewcampaignpage.dart';
import 'package:FARTS/characters/character_select.dart';
import 'package:FARTS/homepage.dart';
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
    //binding collection to ListView. source: https://pub.dev/packages/cloud_firestore
    
    return Scaffold(
      appBar: AppBar(title: Text('Campaigns')),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('campaigns').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              
              if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
              
              if (!snapshot.hasData) return CircularProgressIndicator();
              
              //returns listview of campaign collection items from Firestore
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  return new Card(
                    color: Colors.grey[500],
                    child: ListTile(
                    title: new Text(document['name'], style: TextStyle(fontSize: 16.0, color: Colors.black),),
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                  );
                }
                ).toList(), 
                
              );
            }),)
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {}, 
        label: Text('Create New'),
        backgroundColor: Colors.grey[500],
        ),
    );
  }
}
