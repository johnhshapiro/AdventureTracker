import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModel {
  final docId;
  final name;
  final notes;
  final mapName;
  final party;
  final encounters;

  CampaignModel({
    this.docId,
    this.name,
    this.notes,
    this.mapName,
    this.party,
    this.encounters,
  });

  factory CampaignModel.fromMap(DocumentSnapshot document) {
    return CampaignModel(
        docId: document.documentID,
        name: document['name'],
        notes: document['notes'],
        mapName: document['map_name'],
        party: document['party_test'],
        encounters: document['encounter_test']);
  }
}
