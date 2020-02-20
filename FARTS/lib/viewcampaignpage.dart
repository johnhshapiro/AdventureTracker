import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {

  // Uses the DateTime class to get the current time of the area the device is in.
  var now = new DateTime.now();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        // Streambuilder allows an async. stream from our firestore db to populate widgets on this page.
        body:StreamBuilder(
          // You can provide initial data so your widgets display something whike they are loading snapshots.
          //initialData: dataVariableHere,

          // Here the instance object is created to interact with the db (and all methods bult in to the firestore import)
          stream: Firestore.instance.collection("campaigns").snapshots(),
          builder: (context, snapshot) {
            // Check for snapshot errors, do something about it.
            if (snapshot.hasError) {
              //return UhOh(snapshot.error);
            }
            // Shows a loding progress indicator while data is still being fetched.
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
              // could also return text like the line below
              // return Text("Loading data...");
            }
            // CustomScrollview is the actual name of the gridview widget.
            return CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(50),
                  // .extent just sets max cross axis size (horizontal) whereas .count would set a specific number
                  // of evenly spaced widgets per row.
                  sliver: SliverGrid.extent(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    // This is the max number of pixels the widgets will expand horizontally. 
                    maxCrossAxisExtent: 1080,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Campaign", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                          Container(
                            //alignment: Alignment.topCenter,
                            constraints: BoxConstraints.tightForFinite(),
                            padding: const EdgeInsets.all(15),
                            //margin: EdgeInsets.all(15.0),
                            // Here the text is being accessed from the snapshot of the db. Documents is an array of data snapshots from the db collection
                            // called 'campaigns' (already specified in the stream instance) and the [0] index corresponds to the first item in the collection.
                            // 'name' then specifies we want the data snapshot from the 'name' field, and voila we get the contents of the name field.
                            // TODO change the document index (aka which campaign u want) dyanmic based on which campaign the user/gm has selected in-app.
                            child: Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 20.0)),
                            // if this data was a number you can also just call .toString() at the end of it here.
                          ),
                          Column(
                            children: <Widget>[
                              Text("Date/Time", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(now.toString()),
                                // Todo format it so it just shows the date and time.
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("Session Number", style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: Text("69", style: TextStyle(fontSize: 20.0),),
                                // TODO pull in the session number from db and increment appropriately. 
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Map", style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),),
                          Text("<map name>", style: TextStyle(fontSize: 20.0),),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('assets/samplemap.jpg'),
                            // TODO, actually load the relevant map image form db.
                          ),
                        ],
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
                        constraints: BoxConstraints.tightForFinite(),
                        padding: const EdgeInsets.all(8),
                        child: const Text('Encounters or whatever else here'),
                        color: Colors.yellow,
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
} 
