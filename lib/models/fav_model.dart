class FavoriteModel{
   int index;
   String key;
   int day;
  FavoriteModel({required this.index,required this.key, required this.day}){}

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    index:  int.parse(json["index"]),
    key: json["key"],
    day: int.parse(json["day"]),
  );

  Map<String, dynamic> toJson() => {
    'index': index.toString(),
    'key': key,
    'day': day.toString()
  };
}