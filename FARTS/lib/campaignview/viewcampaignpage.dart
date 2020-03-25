import 'package:FARTS/campaignview/viewmap.dart';
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
  static DateFormat dateFormat = DateFormat("h:mm MM-dd-yy");
  String _now = dateFormat.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: Colors.black,
          body: StreamBuilder(
            stream: Firestore.instance.collection("campaigns").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                throw Exception(
                    "FireStore DB snapshot Error, cannot access campaign collection.");
              }
              // Shows a loading progress indicator while data is still being fetched.
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              // Gets the custom scroll vew body of the page.
              return _getScrollView(context, snapshot);
            },
          )),
    );
  }

  Future _getMap(context, snapshot) async {
    DocumentReference documentReference = snapshot.data.documents[0]['maps'];
    var data;
    documentReference.get().then((datasnapshot) {
      data = datasnapshot.data['imageAddress'.toString()];
    });

    print(data);
    return data;
  }

  _getScrollView(context, snapshot) {
    // CustomScrollview is the actual name of the gridview layout widget.
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(5),
          // .extent just sets max cross axis size (horizontal) whereas .count would set a specific number
          // of evenly spaced widgets per row.
          sliver: SliverGrid.extent(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            // This is the max number of pixels the widgets will expand horizontally.
            maxCrossAxisExtent: 1080,
            children: <Widget>[
              Container(
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
                              fontSize: 16.0, color: Colors.grey[900]),
                        ),
                        Container(
                            padding: EdgeInsets.all(14.0),
                            child: Text(snapshot.data.documents[0]['name'],
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic))),
                        Text("Time/Date",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[900])),
                        Container(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              _now.toString(),
                              style: TextStyle(
                                  fontSize: 26.0,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            )),
                        Text("Session Number",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[900])),
                        Container(
                            // TODO increment the session number dynamically
                            padding: EdgeInsets.all(14.0),
                            child: Text("1",
                                style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic))),
                        Text("Map",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[900])),
                        Container(
                            padding: EdgeInsets.all(14.0),
                            child: Text(snapshot.data.documents[0]['mapName'],
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic))),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapView()));
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    //child: Image.network(snapshot.data.documents[0]['maps'].toString()),
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutter-adventure-rts.appspot.com/o/map.png?alt=media&token=a1549bd9-38d9-4690-b860-5369152e7519"
                            .toString()),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Party info",
                      style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
                    ),
                  ),
                  // Returns a listview inside the container (or a loading circle if data isnt available)
                  !snapshot.hasData
                      ? CircularProgressIndicator
                      : _characterListView(context, snapshot),

                  // FloatingActionButton(
                  //   onPressed: null,
                  //   child: Icon(Icons.add, color: Colors.amber),
                  //   backgroundColor: Colors.grey[800],
                  // ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Notes",
                      style:
                          TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                  Container(
                    color: Colors.grey[900],
                    padding: const EdgeInsets.all(8),
                    child: Text(snapshot.data.documents[0]['notes']),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _characterListView(context, snapshot) {
    return Container(
      // TODO actually get the char data from the db like in the commented code below.
      color: Colors.grey[900],
      padding: EdgeInsets.all(5),
      height: 275,
      child: ListView(
        children: <Widget>[
          Text('character 1'),
          Text('character 2'),
          Text('character 3'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          Text('character n...'),
          //Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 30.0, color: Colors.white, fontStyle: FontStyle.italic))
        ],
      ),
    );
  }
}
