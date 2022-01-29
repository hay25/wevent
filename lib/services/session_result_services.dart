import 'package:wevent/models/general_result_model.dart';
import 'package:wevent/services/session_services.dart';

class SessionResultService extends GeneralResult{
  List<Session> ? sessions;
  GeneralResult ? result;
  SessionResultService({this.sessions,this.result});
  factory SessionResultService.fromJson(Map<String, dynamic> json) =>
      SessionResultService(
        sessions: List<Session>.from(
            json["DATA"].map((x) => Session.fromJson(x))),
        result: GeneralResult.fromJson(json),
      );
}