import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is a problem with status code ${response.statusCode}",
      );
    }
  }

  static Future<dynamic> post({
    required String url,
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("post success");
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is a problem with status code ${response.statusCode}",
      );
    }
  }

  static Future<dynamic> put({
    required String url,
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("put success");
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is a problem with status code ${response.statusCode}",
      );
    }
  }
}
