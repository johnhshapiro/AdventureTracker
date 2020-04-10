import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// Relevant pages.
import 'package:FARTS/services/vibrate.dart';

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  var _campaignStream = Firestore.instance.collection("campaigns").snapshots();
  static DateFormat dateFormat = DateFormat("h:mm MM-dd-yy");
  String _now = dateFormat.format(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          // .extent just sets max cross axis size (horizontal) whereas .count would set a specific number of evenly spaced widgets per row.
          sliver: SliverGrid.extent(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            // This is the max number of pixels the widgets will expand horizontally.
            maxCrossAxisExtent: 1080,
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
                  child: Text(snapshot.data.documents[0]['mapName'],
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

        Text("Notes",style: TextStyle(fontSize: 20.0)),

        Container(
          padding: const EdgeInsets.all(8),
          child: Text(snapshot.data.documents[0]['notes']),
        ),

      ],
    );
  }

}
