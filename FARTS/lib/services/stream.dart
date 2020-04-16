import 'package:FARTS/models/campaign_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModelStream {
  final Firestore _db = Firestore.instance;

  Stream<CampaignModel> streamCampaignData(DocumentSnapshot document) {
    if (document.data.isEmpty) print('CampaignModelStream document is empty');

    return _db
        .collection('campaigns')
        .document(document.documentID)
        .snapshots()
        .map((document) => CampaignModel.fromMap(document));
  }
}
