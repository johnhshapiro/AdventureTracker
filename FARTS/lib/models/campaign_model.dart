import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModel {
  final docId;
  CampaignModel({this.docId});

  factory CampaignModel.fromMap(DocumentSnapshot document) {
    return CampaignModel(docId: document.documentID);
  }
}