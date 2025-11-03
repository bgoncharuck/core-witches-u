import 'dart:convert';

class Ability {
  const Ability({
    required this.id,
    required this.type,
    required this.name,
    required this.value,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      id: json['id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      value: json['value'] is int ? json['value'] as int : 0,
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
      'type': type,
      'name': name,
      'value': value,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  final int id;
  final String type;
  final String name;
  final int? value;
}
