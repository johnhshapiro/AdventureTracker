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

  factory CampaignModel.fromMap(Map data) {
    data = data ?? {};
    return CampaignModel(
        docId: data['userId'],
        name: data['name'],
        notes: data['notes'],
        mapName: data['map_name'],
        party: data['party_test'],
        encounters: data['encounter_test']);
  }
}
