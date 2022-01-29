import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../main.dart';

class WWMService {
  //http.Client _httpClient = new http.Client();

  static Future<Map<String, dynamic>> wGet(
      {required BuildContext context, required String url}) async {
    var _url = Uri.parse(url);
    var response = await http.get(_url);
    print("wGET ----> ${response.toString()}");
    return responseController(response, context);
  }

  static Future<Map<String, dynamic>> wPost(
      {
        required BuildContext context,
        required String url,
        required Map<String, dynamic> body,
        Encoding? encoding,
        bool withHeader = false}) async {

        var _url = Uri.parse(url);
        print(_url.toString());
        print("${_url.toString()}");
        http.Response response;

        if (withHeader) {
          response = await http.post(_url, body: body, encoding: encoding, headers: getUserHeaders());
          print("wPOST ----> ${response.toString()}");
        } else {
          response = await http.post(_url, body: body);
        }
        return responseController(response, context);
  }

  static responseController(http.Response response, BuildContext context) {
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print("RESPONSE CONTROLLER ----> ${jsonResponse.toString()}");
      return jsonResponse;
    } else {

      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  static Map<String, String> getUserHeaders() {
    return {"Authorization": "token"};
  }

}
