// To parse required this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'dart:convert';

List<Session> sessionFromJson(String str) => List<Session>.from(json.decode(str).map((x) => Session.fromJson(x)));

String sessionToJson(List<Session> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Session {
  Session({
    required this.isFavorite,
    required this.id,
    required this.title,
    required this.authors,
    required this.labels,
    required this.date,
    required this.hour,
    required this.room,
    required this.sessionAbstract,
  });

  bool isFavorite;
  String id;
  String title;
  List<Author> authors;
  List<Label> labels;
  int date;
  String hour;
  String room;
  String sessionAbstract;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    isFavorite: json["isFavorite"],
    id: json["_id"],
    title: json["title"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
    date: json["date"],
    hour: json["hour"],
    room: json["room"],
    sessionAbstract: json["abstract"],
  );

  Map<String, dynamic> toJson() => {
    "isFavorite": isFavorite,
    "_id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
    "date": date,
    "hour": hour,
    "room": room,
    "abstract": sessionAbstract,
  };
}

class Author {
  Author({
    required this.name,
    required this.institution,
  });

  String name;
  String institution;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    institution: json["institution"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "institution": institution,
  };
}

class Label {
  Label({
    required this.name,
    required this.color,
  });

  String name;
  String color;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    name: json["name"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
  };
}
