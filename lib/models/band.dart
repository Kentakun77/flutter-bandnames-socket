// To parse this JSON data, do
//
//     final band = bandFromJson(jsonString);

import 'dart:convert';

Band bandFromJson(String str) => Band.fromJson(json.decode(str));

String bandToJson(Band data) => json.encode(data.toJson());

class Band {
  Band({
    this.name,
    this.id,
    this.vote,
  });

  String name;
  String id;
  int vote;

  factory Band.fromJson(Map<String, dynamic> json) => Band(
    name: json["name"],
    id: json["id"],
    vote: json["vote"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "vote": vote,
  };
}
