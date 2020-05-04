import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CampaignModelStream {
  final Firestore _db = Firestore.instance;

  Stream<CampaignModel> streamCampaignData(DocumentSnapshot document) {

    return _db
        .collection('campaigns')
        .document(document.documentID)
        .snapshots()
        .map((doc) => CampaignModel.fromMap(doc));
  }
}
Widget showCorrectWidget(dynamic stream, Widget widgetToLoad) {
  if (stream == null) {
    return Center(child: CircularProgressIndicator(),);
  }
  return widgetToLoad;
}
Widget showCorrectWidgetFromSnapshot(AsyncSnapshot<QuerySnapshot> snapshot, Widget widgetToLoad) {
  if (snapshot.hasError)
    return new Text('Campaign snapshot error ${snapshot.error}');

  if (!snapshot.hasData)
    return Center(child: CircularProgressIndicator());

  return widgetToLoad;
}
