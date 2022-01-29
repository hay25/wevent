import 'package:flutter/material.dart';
import 'package:wevent/constants/app_enums.dart';
import 'package:wevent/models/general_result_model.dart';
import 'package:wevent/models/sesion_result_model.dart';
import 'package:wevent/services/wwm_service.dart';

class AppServices{
  static Future<SessionResultModel> getSessions(
      {required BuildContext context}) async {
    var jsonResponse = await WWMService.wPost(
        url: APILinks.SESSIONS.url,
        body: {},
        withHeader: true,
        context: context);
    print(jsonResponse.toString());
    return SessionResultModel.fromJson(jsonResponse);
  }

}