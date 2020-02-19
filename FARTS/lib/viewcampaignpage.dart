import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        // Here the text is being accessed from the snapshot of the db. Documents is an array of data snapshots from the db collection
                        // called 'campaigns' (already specified in the stream instance) and the [0] index corresponds to the first item in the collection.
                        // 'name' then specifies we want the data snapshot from the 'name' field, and voila we get the contents of the name field.
                        // TODO change the document index (aka which campaign u want) dyanmic based on which campaign the user/gm has selected in-app.
                        child: Text(snapshot.data.documents[0]['name']),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "Date/Session #"),
                          // TODO generate the date and time programatically, fetch session nummber from db
                        ),
                      ),
                      Container(  
                        padding: const EdgeInsets.all(1),
                        child: Image.asset('assets/samplemap.jpg'),
                        // TODO, actually load the relevant map from the campaign collection not just a file from the assets folder.
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "Notes"),
                        ),
                        // TODO get notes from the campaign collection in the db, not just hard coded text
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "Characters"),
                        ),
                        // TODO, get characters from db
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "NPCS"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Encounters'),
                        color: Colors.green,
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
