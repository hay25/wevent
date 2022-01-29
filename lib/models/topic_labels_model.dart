import 'package:wevent/utils/app_enums.dart';

class TopicLabel{
  String? name;
  WTagColor? color;

  TopicLabel({this.name, this.color});

  factory TopicLabel.fromJson(Map<String, dynamic> json) => TopicLabel(
    name: json["labelName"],
    color: json["labelColor"],
  );

  Map<String, dynamic> toJson(TopicLabel label) => {
    'labelName': label.name,
    'labelColor': label.color,
  };
}