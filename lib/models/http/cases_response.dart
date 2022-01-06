// To parse this JSON data, do
//
//     final casesResponse = casesResponseFromMap(jsonString);

import 'package:covid_19_cases/models/result.dart';
import 'dart:convert';

class CasesResponse {
  int? count;
  String? next;
  dynamic? previous;
  List<Result>? results;

  CasesResponse({this.count, this.next, this.previous, this.results});

  CasesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

