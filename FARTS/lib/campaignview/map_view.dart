import 'package:FARTS/campaignview/campaign_view.dart';
import 'package:FARTS/models/campaign_model.dart';
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
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset('assets/samplemap.jpg'),
            // TODO create a field in the DB for a map and pull it down via the _campaignModelStream (need to have a map field in campaign model, could be a URL string maybe)
            Positioned(
                bottom: 5.0,
                left: 5.0,
                child: Text(_campaignModelStream.mapName,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic))),
          ],
        ),
      ],
    ));
  }
}
