import 'package:FARTS/characters/character_model.dart';

class MockCharacter {

  Character _mockChar = Character(
    alignment: "true neutral",
    attacksAndSpells: [],
    background: "Sole purpose in life is to exist for testing",
    classes: "1337 tester",
    experiencePoints: 9001,
    inventory: {'armor': ['Plate']},
    languages: ['Common'],
    name: 'Mock Jr.',
    notes: 'test',
    race: 'Mock',
    skills: 'Insight',
    stats: {
      'cha': 3,
      'int': 18,
      'wis': 18,
      'con': 12,
      'str': 12,
      'dex': 12
    },
    campaignId: '',
    userId: 'M8OTV0XlKcW6l4YhGyUCNY74Sfj1'
  );

  Character get mockCharacter {
    return _mockChar;
  }

}