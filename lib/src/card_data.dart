import 'dart:convert';
// ignore: always_use_package_imports
import 'ability.dart';

class CardData {
  const CardData({
    required this.id,
    required this.type,
    required this.influence,
    required this.deck,
    required this.name,
    required this.cost,
    required this.firstAbility,
    required this.secondAbility,
    required this.thirdAbility,
    required this.commonDeckAbility,
    required this.uncommonDeckAbility,
    required this.rareDeckAbility,
  });

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'] as int,
      type: json['type'] as String,
      influence: json['influence'] as int,
      deck: json['deck'] as String,
      name: json['name'] as String,
      cost: json['cost'] as int,
      firstAbility: Ability.fromJson(
        json['firstAbility'] as Map<String, dynamic>,
      ),
      secondAbility: Ability.fromJson(
        json['secondAbility'] as Map<String, dynamic>,
      ),
      thirdAbility: Ability.fromJson(
        json['thirdAbility'] as Map<String, dynamic>,
      ),
      commonDeckAbility: Ability.fromJson(
        json['commonDeckAbility'] as Map<String, dynamic>,
      ),
      uncommonDeckAbility: Ability.fromJson(
        json['uncommonDeckAbility'] as Map<String, dynamic>,
      ),
      rareDeckAbility: Ability.fromJson(
        json['rareDeckAbility'] as Map<String, dynamic>,
      ),
    );
  }

  factory CardData.fromJsonString(String jsonString) {
    return CardData.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'influence': influence,
      'deck': deck,
      'name': name,
      'cost': cost,
      'firstAbility': firstAbility.toJson(),
      'secondAbility': secondAbility.toJson(),
      'thirdAbility': thirdAbility.toJson(),
      'commonDeckAbility': commonDeckAbility.toJson(),
      'uncommonDeckAbility': uncommonDeckAbility.toJson(),
      'rareDeckAbility': rareDeckAbility.toJson(),
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  final int id;
  final String type;
  final int influence;
  final String deck;
  final String name;
  final int cost;
  final Ability firstAbility;
  final Ability secondAbility;
  final Ability thirdAbility;
  final Ability commonDeckAbility;
  final Ability uncommonDeckAbility;
  final Ability rareDeckAbility;
}
