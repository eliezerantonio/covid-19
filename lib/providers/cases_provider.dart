import 'package:covid_19_cases/api/covid_api.dart';
import 'package:covid_19_cases/models/http/cases_response.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:flutter/foundation.dart';

class CasesProvider with ChangeNotifier {
  CasesProvider() {
    getCases();
  }

  List<Result> cases = [];

  String nextPage = "";

  Future<void> getCases() async {
    int actualPage = 1;

    final response = await CovidApi.httpGet("/");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];
    actualPage++;
    nextPage = '?page=$actualPage';
    print(nextPage);
    notifyListeners();
  }

  Future<void> search({String? state = "", String? date = ""}) async {
    cases.clear();
    final response = await CovidApi.httpGet("/?search&date=$date&state=$state");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];

    notifyListeners();
  }
}
