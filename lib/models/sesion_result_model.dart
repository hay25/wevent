import 'dart:convert';
import 'package:wevent/models/session_service.dart';
import 'general_result_model.dart';

SessionResultModel sessionResultFromJson(String str) =>
    SessionResultModel.fromJson(json.decode(str));

class SessionResultModel extends GeneralResult {
  SessionResultModel({  this.sessions,  this.result});

  List<Session>? sessions;
  GeneralResult? result;

  factory SessionResultModel.fromJson(Map<String, dynamic> json) =>
      SessionResultModel(
        sessions: List<Session>.from(
            json["DATA"].map((x) => Session.fromJson(x))),
        result: GeneralResult.fromJson(json),
      );
}
