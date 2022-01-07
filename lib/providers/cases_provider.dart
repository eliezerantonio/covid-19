import 'package:covid_19_cases/api/covid_api.dart';
import 'package:covid_19_cases/models/http/cases_response.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:flutter/foundation.dart';

class CasesProvider with ChangeNotifier {
  CasesProvider() {
    getCases();
  }

  List<Result> cases = [];

  Future<void> getCases() async {
    final response = await CovidApi.httpGet("/");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];

    notifyListeners();
  }
}
