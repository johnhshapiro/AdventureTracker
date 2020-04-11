import 'dart:async';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:intl/intl.dart';

// Relevant pages.
import 'package:FARTS/services/vibrate.dart';

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {

  Stream<QuerySnapshot> _campaignStream;
  static DateFormat dateFormat = DateFormat("h:mm M-dd-yy");
  String _now = dateFormat.format(DateTime.now());

  bool _isEditingText = false;
  TextEditingController _editingController;
  //String _initialText = "CampaiNotes";

  final CollectionReference _campaignCollection = Firestore.instance.collection('campaigns');
  //DocumentReference initText = Firestore.instance.document('campaigns/CcQAZ4zjpWYozjVs8lPD/notes');
  

  @override
  void initState() {
    super.initState();
    _campaignStream = Firestore.instance.collection("campaigns").snapshots();
    // you can add initial text to the tex controler as a paramters <text: "intitial text">
    _editingController = TextEditingController();
  }
  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          body: StreamBuilder(
            stream: _campaignStream,
            builder: (context, snapshot) {

              if (snapshot.hasError) return Text('Error: ${snapshot.error}');

              if (!snapshot.hasData) return CircularProgressIndicator();

              // this initilzes the notes with the db value.
              _editingController.text = snapshot.data.documents[0]['notes'];

              return _getScrollView(context, snapshot);
            }
          ))
    );
  }

  _getScrollView(context, snapshot) {
    // CustomScrollview is the actual name of the *gridview* layout widget.
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(5),
          // .extent sets max cross axis size (horizontal pixels) whereas .count set a specific number of evenly spaced widgets per row.
          sliver: SliverGrid.count(
            crossAxisCount: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            // This is the max number of pixels the widgets will expand horizontally.
            //maxCrossAxisExtent: 1080,
            children: <Widget>[

              _campaignHeader(context, snapshot),

              _campaignNotes(context, snapshot),

            ],
          ),
        ),
      ],
    );
  }

  _campaignHeader(context, snapshot) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.all(5.0),

      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Image(
            image: AssetImage('assets/realoldpaper.jpg'),
            fit: BoxFit.cover,
          ),
          
          Column(
            children: <Widget>[

              Text(
                "Campaign",
                  style: TextStyle(
                  fontSize: 16.0, 
                  color: Colors.grey[900]),
              ),

              Container(
                  padding: EdgeInsets.all(14.0),
                  child: Text(snapshot.data.documents[0]['name'],
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic))
              ),

              Text("Time/Date",
                  style: TextStyle(
                    fontSize: 16.0, 
                    color: Colors.grey[900])
              ),

              Container(
                  padding: EdgeInsets.all(14.0),
                  child: Text(_now.toString(), 
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                  ),
              ),

              Text("Session Number", style: TextStyle(fontSize: 16.0, color: Colors.grey[900])),

              Container(
                  // TODO increment the session number dynamically
                  padding: EdgeInsets.all(14.0),
                  child: Text("1",
                    style: TextStyle(
                      fontSize: 26.0, 
                      color: Colors.black, 
                      fontStyle: FontStyle.italic))
              ),

              Text("Map", style: TextStyle(fontSize: 16.0, color: Colors.grey[900])),
                      
              Container(
                  padding: EdgeInsets.all(14.0),
                  child: Text(snapshot.data.documents[0]['map_name'],
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic)),
              ),

            ],
          ),
        ],
      ),
    );
  }

  _campaignNotes(context, snapshot) {

    return Column(
      children: <Widget>[

        Text("Notes", style: TextStyle(fontSize: 20.0)),

        _editNotes(context, snapshot),

      ],
    );
  }

  _editNotes(context, snapshot) {

    if (_isEditingText)

      return Card(
        child: TextField(
          maxLines: null,
          onSubmitted: (newValue){
            setState(() {
              _updateNotes(context, newValue);
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(snapshot.data.documents[0]['notes'])
    );
  }

  Future _updateNotes(context, newValue) async {
    try {
      await _campaignCollection.document("CcQAZ4zjpWYozjVs8lPD").updateData({
        'notes' : "$newValue"
      });
    } catch (e) {
      print(e.code);
    }
  }

}
