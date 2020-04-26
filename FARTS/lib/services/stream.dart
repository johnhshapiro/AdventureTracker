import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModelStream {
  final Firestore _db = Firestore.instance;

  Stream<CampaignModel> streamCampaignData(String uid) {

    return _db
        .collection('campaigns')
        .document(uid)
        .snapshots()
        .map((snap) => CampaignModel.fromMap(snap.data));
  }
}
