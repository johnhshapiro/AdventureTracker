import 'package:cloud_firestore/cloud_firestore.dart';

class Character {
  final dynamic alignment;
  final dynamic attacksAndSpells;
  final dynamic background;
  final dynamic classes;
  final dynamic experiencePoints;
  final dynamic inventory;
  final dynamic languages;
  final dynamic name;
  final dynamic notes;
  final dynamic race;
  final dynamic skills;
  final dynamic stats;
  final dynamic campaignId;
  final dynamic userId;


  Character({ this.alignment, 
              this.attacksAndSpells, 
              this.background,
              this.classes,
              this.experiencePoints,
              this.inventory,
              this.languages,
              this.name,
              this.notes,
              this.race,
              this.skills,
              this.stats,
              this.campaignId,
              this.userId});


}