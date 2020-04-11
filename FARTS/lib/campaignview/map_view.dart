import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Relevant Pages
import 'package:FARTS/homepage.dart';

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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasError) return Text('Unable to get map from FireStore DB: ${snapshot.error}');

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignView()));
                },
                child: Image.asset('assets/samplemap.jpg')
              ),

              Positioned(
                bottom: 5,
                left: 5,
                child: Text(snapshot.data.documents[0]['map_name'],
                        style: TextStyle(fontSize: 30.0, 
                        color: Colors.black, 
                        fontStyle: FontStyle.italic))
              ),
            ],
          ),
        ],
      );
    }

}