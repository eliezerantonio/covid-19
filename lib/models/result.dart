import 'dart:convert';

import 'http/cases_response.dart';

class Result {
  Result({
    required this.city,
    required this.cityIbgeCode,
    required this.confirmed,
    required this.confirmedPer100KInhabitants,
    required this.date,
    required this.deathRate,
    required this.deaths,
    required this.estimatedPopulation,
    required this.estimatedPopulation2019,
    required this.isLast,
    required this.orderForPlace,
    required this.placeType,
    required this.state,
  });

  String city;
  String cityIbgeCode;
  int confirmed;
  double confirmedPer100KInhabitants;
  DateTime date;
  double deathRate;
  int deaths;
  int estimatedPopulation;
  int estimatedPopulation2019;
  bool isLast;
  int orderForPlace;
  PlaceType? placeType;
  State? state;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        city: json["city"] == null ? null : json["city"],
        cityIbgeCode:
            json["city_ibge_code"] == null ? null : json["city_ibge_code"],
        confirmed: json["confirmed"],
        confirmedPer100KInhabitants:
            json["confirmed_per_100k_inhabitants"] == null
                ? null
                : json["confirmed_per_100k_inhabitants"].toDouble(),
        date: DateTime.parse(json["date"]),
        deathRate: json["death_rate"].toDouble(),
        deaths: json["deaths"],
        estimatedPopulation: json["estimated_population"] == null
            ? null
            : json["estimated_population"],
        estimatedPopulation2019: json["estimated_population_2019"] == null
            ? null
            : json["estimated_population_2019"],
        isLast: json["is_last"],
        orderForPlace: json["order_for_place"],
        placeType: placeTypeValues.map[json["place_type"]],
        state: stateValues.map[json["state"]],
      );

  Map<String, dynamic> toMap() => {
        "city": city == null ? null : city,
        "city_ibge_code": cityIbgeCode == null ? null : cityIbgeCode,
        "confirmed": confirmed,
        "confirmed_per_100k_inhabitants": confirmedPer100KInhabitants == null
            ? null
            : confirmedPer100KInhabitants,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "death_rate": deathRate,
        "deaths": deaths,
        "estimated_population":
            estimatedPopulation == null ? null : estimatedPopulation,
        "estimated_population_2019":
            estimatedPopulation2019 == null ? null : estimatedPopulation2019,
        "is_last": isLast,
        "order_for_place": orderForPlace,
        "place_type": placeTypeValues.reverse[placeType],
        "state": stateValues.reverse[state],
      };
}
