// To parse this JSON data, do
//
//     final band = bandFromJson(jsonString);

import 'dart:convert';

Band bandFromJson(String str) => Band.fromJson(json.decode(str));

String bandToJson(Band data) => json.encode(data.toJson());

class Band {
  Band({
    this.id,
    this.name,
    this.vote,
  });

  String id;
  String name;
  int vote;

  factory Band.fromJson(Map<String, dynamic> json) => Band(
    id: json.containsKey('id') ? json["id"] : 'no-id',
    name: json.containsKey('name') ? json["name"] : 'no-name',
    vote: json.containsKey('vote') ? json["vote"] : 'no-vote',
  );

  factory Band.fromMap( Map<String, dynamic> obj )
  => Band(
      id   : obj.containsKey('id') ? obj['id'] : 'no-id',
      name : obj.containsKey('name') ? obj['name'] : 'no-name',
      vote: obj.containsKey('vote') ? obj['vote'] : 'no-vote'
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "vote": vote,
  };
}
