import 'dart:async';
import 'package:FARTS/models/campaign_model.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  var _campaignModelStream;
  final CollectionReference _campaignCollectionRef =
      Firestore.instance.collection('campaigns');
  static DateFormat dateFormat = DateFormat("h:mm M-dd-yy");
  String _now = dateFormat.format(DateTime.now());
  bool _isEditingText = false;
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initializes the stream of data for this specifici campaign, mapped from firestore to the local CampaignModel
    _campaignModelStream = Provider.of<CampaignModel>(context);
    // Check for campaign info to avoid a redscreen on slower phones while info is loading
    if (_campaignModelStream == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      // Initilzes the notes with the CampaignModel value.
      _editingController.text = _campaignModelStream.notes;

      return SafeArea(
          top: false,
          child: Scaffold(
            body: _getScrollView(),
          ));
    }
  }

  Widget _getScrollView() {
    // CustomScrollview is the actual name of the *gridview* layout widget.
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage('assets/realoldpaper.jpg'),
          fit: BoxFit.cover,
        ),
        CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(5),
              // .extent sets max cross axis size (horizontal pixels) whereas .count set a specific number of evenly spaced widgets per row.
              sliver: SliverGrid.count(
                crossAxisCount: 1,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                // This is the max number of pixels the widgets will expand horizontally.
                //maxCrossAxisExtent: 1080,
                children: <Widget>[
                  CampaignHeader(_campaignModelStream.name,
                      _campaignModelStream.mapName, _now.toString()),
                  _campaignNotes(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _campaignNotes() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Text("Notes", style: TextStyle(fontSize: 20.0, color: Colors.black)),
          _editNotes(),
        ],
      ),
    );
  }

  Widget _editNotes() {
    if (_isEditingText)
      return Card(
        child: TextField(
          //keyboardType: ,
          //maxLines: 15,
          onSubmitted: (newValue) {
            setState(() {
              _updateNotes(newValue);
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
          onTap: () {
            setState(() {
              _isEditingText = true;
            });
          },
          child: Text(
            _campaignModelStream.notes,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontStyle: FontStyle.italic),
          )),
    );
  }

  Future _updateNotes(newValue) async {
    try {
      await _campaignCollectionRef
          .document(_campaignModelStream.docId)
          .updateData({'notes': "$newValue"});
    } catch (e) {
      print(e.code);
    }
  }
}

class CampaignHeader extends StatelessWidget {
  final String _name;
  final String _mapName;
  final String _now;
  const CampaignHeader(this._name, this._mapName, this._now);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Text(
            "Campaign",
            style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
          ),
          Container(
              padding: EdgeInsets.all(14.0),
              child: Text(_name,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic))),
          Text("Time/Date",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[900])),
          Container(
            padding: EdgeInsets.all(14.0),
            child: Text(
              _now,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Text("Session Number",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[900])),
          Container(
              // TODO increment the session number dynamically
              padding: EdgeInsets.all(14.0),
              child: Text("1",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic))),
          Text("Map",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[900])),
          Container(
            padding: EdgeInsets.all(14.0),
            child: Text(_mapName,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }
}
