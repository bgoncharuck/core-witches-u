import 'dart:convert';

enum AbilityType {
  usage,
  whilePlayed,
  darkness,
  chaos,
  ignoreChaos,
  protect,
  freePurchase,
}

class Ability {
  const Ability({
    required this.id,
    required this.type,
    required this.name,
    required this.value,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      id: json['id'] as String,
      type: AbilityType.values.byName(json['type'] as String),
      name: json['name'] as String,
      value: json['value'] as int,
    );
  }

  factory Ability.fromJsonString(String jsonString) {
    return Ability.fromJson(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'name': name,
      'value': value,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  final String id;
  final AbilityType type;
  final String name;
  final int value;
}
