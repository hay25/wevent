import 'dart:convert';

GeneralResult generalResultFromJson(String str) =>
    GeneralResult.fromJson(json.decode(str));

class GeneralResult {
  GeneralResult({
     this.state,
     this.message,
  });

  bool? state;
  String? message;

  factory GeneralResult.fromJson(Map<String, dynamic> json) => GeneralResult(
        state: json["STATE"],
        message: json["MESSAGE"],
      );
}
