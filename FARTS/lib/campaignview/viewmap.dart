import 'package:FARTS/campaignview/viewcampaignpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  @override
  build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('campaigns').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) throw Exception ('Unable to get map from FireStore DB.');
          if (!snapshot.hasData) return CircularProgressIndicator();
          return _mapViewBody(context, snapshot);
        }
      ),
    );
  }

    _mapViewBody(context, AsyncSnapshot snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Campaign()));
                },
                child: Image.asset('assets/samplemap.jpg')),
                // TODO actually get the map name from the DB with a similar snapshot like below.
                //child: Text(snapshot.data.documents[0]['name'], style: TextStyle(fontSize: 30.0, color: Colors.black, fontStyle: FontStyle.italic))
              Positioned(
                bottom: 5,
                left: 5,
                child: Text('<Map Name From DB>', style: TextStyle(color: Colors.black, fontSize: 24),)),
            ],
          ),
        ],
      );
  }

}