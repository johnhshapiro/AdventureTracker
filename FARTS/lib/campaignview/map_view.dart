import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  var _campaignModelStream;

  @override
  build(BuildContext context) {
    _campaignModelStream = Provider.of<CampaignModel>(context);

    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('campaigns').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text(
                  'Unable to get map from FireStore DB: ${snapshot.error}');

            if (!snapshot.hasData) return CircularProgressIndicator();

            return _mapViewBody(context, snapshot);
          }),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CampaignView()));
                },
                child: Image.asset('assets/samplemap.jpg')),
                // TODO create a field in the DB for a map and pull it down via the _campaignModelStream (need to have a map field in campaign model, could be a URL string maybe)
            Positioned(
                bottom: 5,
                left: 5,
                child: Text(_campaignModelStream.mapName,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic))),
          ],
        ),
      ],
    );
  }
}
