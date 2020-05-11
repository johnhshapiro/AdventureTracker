import 'package:FARTS/models/campaign_model.dart';
import 'package:FARTS/services/stream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EncounterView extends StatefulWidget {
  @override
  _EncounterViewState createState() => _EncounterViewState();
}

class _EncounterViewState extends State<EncounterView> {
  var _campaignModelStream;

  @override
  Widget build(BuildContext context) {
    _campaignModelStream = Provider.of<CampaignModel>(context);
    return showCorrectWidget(
      _campaignModelStream,
      encounterViewWidget(_campaignModelStream),
    );
  }
}

Widget encounterViewWidget(CampaignModel campaign) {
  var encounters = [];
  try {
    encounters = campaign.encounters;
  } catch (e) {
    print("Encounter Data Loading");
  }
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage('assets/realoldpaper.jpg'),
          fit: BoxFit.fill,
        ),
        ListView.builder(
            itemCount: encounters.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.transparent,
                child: ListTile(
                  trailing: Text("example XP",
                      style: TextStyle(fontSize: 12.0, color: Colors.black)),
                  title: Text(encounters[index],
                      style: TextStyle(color: Colors.black)),
                  onTap:
                      null, // TODO uncomment and navigate to the corresponding encounter data.
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     pageBuilder: (context, a1, a2) =>
                  //         RELEVANTENCOUNTERPAGE(),
                  //     transitionsBuilder:
                  //         (context, animation, a2, child) =>
                  //             FadeTransition(
                  //                 opacity: animation, child: child),
                  //     transitionDuration: Duration(milliseconds: 800),
                  //   ),
                  // );
                ),
              );
            }),
      ],
    ),
  );
}
