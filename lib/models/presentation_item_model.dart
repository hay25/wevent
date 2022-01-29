import 'dart:convert';

import 'package:wevent/models/authors_model.dart';
import 'package:wevent/models/topic_labels_model.dart';

class PresentationItem{
  String? title;
  List<Authors>? authors;
  List<TopicLabel>? labels;
  bool? isFavorite;
  String? date;
  String? hour;
  String? room;
  String? abstract;
  PresentationItem({this.title, this.authors, this.labels, this.isFavorite, this.date, this.hour, this.room,this.abstract});


  factory PresentationItem.fromJson(Map<String, dynamic> json) {
    return PresentationItem(
      title: json['title'],
      isFavorite: json['isFavorite'],
      hour: json['hour'],
      date: json['date'],
      room: json['room'],
    );
  }

  static Map<String, dynamic> toJson(PresentationItem event){
  String  authorList = jsonEncode(event.authors) ;
  List<Map>  lblList = event.labels!.map((e) => e.toJson(e)).toList() ;
  return{
    'title': event.title,
    'isFavorite': event.isFavorite,
    'hour': event.hour,
    'date': event.date,
    'labels': lblList,
    'authors':authorList,
    'room':event.room,
    'abstract':event.abstract,
    };
  }

  static String encode(List<PresentationItem> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((event) => PresentationItem.toJson(event))
        .toList(),
  );

  static List<PresentationItem> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<PresentationItem>((item) => PresentationItem.fromJson(item))
          .toList();

}