// To parse this JSON data, do
//
//     final casesResponse = casesResponseFromMap(jsonString);

import 'package:covid_19_cases/models/result.dart';
import 'dart:convert';

class CasesResponse {
  CasesResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory CasesResponse.fromJson(String str) =>
      CasesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CasesResponse.fromMap(Map<String, dynamic> json) => CasesResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

enum PlaceType { STATE, CITY }

final placeTypeValues =
    EnumValues({"city": PlaceType.CITY, "state": PlaceType.STATE});

enum State {
  AL,
  AM,
  AP,
  BA,
  CE,
  DF,
  ES,
  GO,
  MA,
  MG,
  MT,
  PA,
  PB,
  PE,
  PI,
  PR,
  RJ,
  RO,
  RS,
  SC,
  SE,
  SP,
  AC,
  MS,
  RN,
  RR,
  TO
}

final stateValues = EnumValues({
  "AC": State.AC,
  "AL": State.AL,
  "AM": State.AM,
  "AP": State.AP,
  "BA": State.BA,
  "CE": State.CE,
  "DF": State.DF,
  "ES": State.ES,
  "GO": State.GO,
  "MA": State.MA,
  "MG": State.MG,
  "MS": State.MS,
  "MT": State.MT,
  "PA": State.PA,
  "PB": State.PB,
  "PE": State.PE,
  "PI": State.PI,
  "PR": State.PR,
  "RJ": State.RJ,
  "RN": State.RN,
  "RO": State.RO,
  "RR": State.RR,
  "RS": State.RS,
  "SC": State.SC,
  "SE": State.SE,
  "SP": State.SP,
  "TO": State.TO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
