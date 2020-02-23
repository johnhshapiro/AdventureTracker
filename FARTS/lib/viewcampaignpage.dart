import 'package:FARTS/homepage.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Relevant pages.
import 'package:FARTS/vibrate.dart';

// This album class contains the converted future data from the network request. 
class Album {
  final userId;
  final id;
  final title;
  Album({this.userId, this.id, this.title});

  // This factory constructor crates an album form JSON.
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

// This future gets the http data
// Future<Album> fetchAlbum() async {
//   final response = await http.get('http://dnd5eapi.co/api/spells/acid-arrow');

//   // 200 code = sucess code form server, returns an album
//   if(response.statusCode == 200) {
//     return Album.fromJson(json.decode(response.body));
//   }
//   // If you dont get a 200 code, throw and error.
//   else {
//     throw Exception('Failed to load album from http.get method');
//   }
// }

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {

  // Holds the future data in an album object.
  Future<Album> futureAlbum;

  // The actual API call is here, NOT in body so it isnt making an API call every time the build method is called
  // (which happens a lot and will slow down the app, the API, and burn data).
  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = fetchAlbum();
  // }
  // Uses the DateTime class to get the current time of the area the device is in.
  var _now = new DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        // Streambuilder allows an async. stream from our firestore db to populate widgets on this page.
        body:StreamBuilder(
          key: Key('streamBuilderKey'),
          // You can provide initial data so your widgets display something whike they are loading snapshots.
          //initialData: dataVariableHere,

          // Here the instance object is created to interact with the db (and all methods bult in to the firestore import)
          stream: Firestore.instance.collection("campaigns").snapshots(),
          builder: (context, snapshot) {
            // Shows a loading progress indicator while data is still being fetched.
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              //return UhOh(snapshot.error);
              // TODO actually throw an exception or log an error.
            }
            // CustomScrollview is the actual name of the gridview layout widget.
            return CustomScrollView(
              key: Key('CSV'), 
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(5),
                  // .extent just sets max cross axis size (horizontal) whereas .count would set a specific number
                  // of evenly spaced widgets per row.
                  sliver: SliverGrid.extent(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    // This is the max number of pixels the widgets will expand horizontally. 
                    maxCrossAxisExtent: 1080,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50.0),
                        //padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text("Campaign", style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),),
                            Container(
                              padding: EdgeInsets.all(14.0),
                              child: Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 20.0))),
                            Text("Date/Time", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                            Container(
                              padding: EdgeInsets.all(14.0),
                              child: Text(_now.toString(), style: TextStyle(fontSize: 20.0),)),
                              // TODO format the time and date to be 'murican.
                            Text("Session Number", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                            Container(
                              padding: EdgeInsets.all(14.0),
                              child: Text("69", style: TextStyle(fontSize: 20.0),)),
                            Text("Map", style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),),
                            Container(
                              padding: EdgeInsets.all(14.0),
                              child: Text("<map name>", style: TextStyle(fontSize: 20.0),)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Image.asset('assets/samplemap.jpg'),
                          // TODO, actually load the relevant map image form db.
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text("Notes", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(snapshot.data.documents[0]['notes']),
                            
                            // TODO get notes from the campaign collection in the db, not just hard coded text
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        //color: Colors.green,
                        child: Text("Party info here maybe, colors/shape just to show some stuff that can be done",
                          style: TextStyle(fontSize: 20.0, color: Colors.yellow),),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "NPCS"),
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          color: Colors.red,
                          child: Text("I'm an API Button that prints everything you could possibly want to know about acid arrow to the console", style: TextStyle(fontSize: 30.0),),
                          onPressed: () {
                            Vibrate().epicRoll();
                            //_callAPI();
                        },),
                      ),
                      Container( // This widget displays the API future data as an album. 
                        color: Colors.blue[100],
                        child: FutureBuilder<Album>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data.title);
                            }
                            else {
                              return Text("${snapshot.error}");
                            }
                          } 
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
    );
  }
  void _callAPI() async{
    print(await http.read('http://dnd5eapi.co/api/spells/acid-arrow/'));
  }
} 

