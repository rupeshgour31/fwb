import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/url_constants.dart';

class Networking {
  static Future<String> post(url, body) async {
    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPrefHelper.authToken}",
      'username': "${SharedPrefHelper.userEmail}",
      'Content-Type': 'application/json',
    };
    debugPrint(Endpoints.baseURL + url);
    debugPrint(header.toString());
    debugPrint(body);

    final http.Response res = await http.post(
      Uri.parse(Endpoints.baseURL + url),
      body: body,
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }

  static Future<String> get(url) async {
    debugPrint(Endpoints.baseURL + url);

    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPrefHelper.authToken}",
      'Content-Type': 'application/json',
    };
    debugPrint(header.toString());
    http.Response res = await http.get(
      Uri.parse(Endpoints.baseURL + url),
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }

  static Future<String> put(url, body) async {
    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPrefHelper.authToken}",
      'username': "${SharedPrefHelper.userEmail}",
      'Content-Type': 'application/json',
    };
    debugPrint(Endpoints.baseURL + url);
    debugPrint(header.toString());
    debugPrint(body);

    final http.Response res = await http.put(
      Uri.parse(Endpoints.baseURL + url),
      body: body,
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }

  static Future<String> delete(url) async {
    debugPrint(Endpoints.baseURL + url);

    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPrefHelper.authToken}",
      'Content-Type': 'application/json',
    };
    debugPrint(header.toString());
    http.Response res = await http.delete(
      Uri.parse(Endpoints.baseURL + url),
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }
}
