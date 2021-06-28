// To parse this JSON data, do
//
//     final school = schoolFromJson(jsonString);

import 'dart:convert';

List<School> schoolFromJson(String str) =>
    List<School>.from(json.decode(str).map((x) => School.fromJson(x)));

String schoolToJson(List<School> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class School {
  School({
    this.id,
    this.abbr,
    this.name,
  });

  int? id;
  String? abbr;
  String? name;

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        abbr: json["abbr"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbr": abbr,
        "name": name,
      };
}
