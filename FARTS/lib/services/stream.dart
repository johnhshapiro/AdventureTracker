import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModelStream {
  final Firestore _db = Firestore.instance;

  Stream<CampaignModel> streamCampaignData(DocumentSnapshot document) {
    return _db
        .collection('campaigns')
        .document(document.documentID)
        .snapshots()
        .map((docId) => CampaignModel.fromMap(docId));
  }

}