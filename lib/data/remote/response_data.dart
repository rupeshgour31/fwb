import 'package:flutter/material.dart';

@immutable
class Response<T> {
  int status;
  String message;
  T data;
  Map? error;

  Response(
    this.status,
    this.message,
    this.data,
    this.error,
  );

  factory Response.fromJson(Map<String, dynamic> json) {
    final s = json['status'] as int;
    final m = json['message'] as String;
    final e = json['error'] as Map;
    final data = json['data'];
    return Response(s, m, data, e);
  }
}
