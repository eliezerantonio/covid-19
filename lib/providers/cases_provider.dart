import 'package:covid_19_cases/api/covid_api.dart';
import 'package:covid_19_cases/models/http/cases_response.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CasesProvider with ChangeNotifier {
  CasesProvider() {
    getCases();
  }

  List<Result> cases = [];

  bool nextPage = true;
  bool previusPage = false;
  int actualPage = 2;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getCases() async {
    loading = true;
    final response = await CovidApi.httpGet("/");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];
    actualPage = 2;
    loading = false;
  }

  Future<void> getCasesNextPage() async {
    if (!canNextPage(actualPage)) return;
    loading = true;
    final response = await CovidApi.httpGet("/?page=$actualPage");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];
    actualPage++;

    loading = false;
  }

  Future<void> getCasesPreviusPage() async {
    if (!canPreviusPage(actualPage)) return;
    loading = true;
    final response = await CovidApi.httpGet("/?page=$actualPage");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];
    actualPage--;

   loading = false;
  }

  Future<void> search({String? state = "", String? date = ""}) async {
    cases.clear();
    loading = true;
    final response = await CovidApi.httpGet("/?search&date=$date&state=$state");
    final casesResponse = CasesResponse.fromJson(response);

    cases = [...?casesResponse.results];

   loading = false;
  }

  bool canNextPage(int actualPage) {
    if (actualPage <= 23) {
      previusPage = true;
      nextPage = true;
      return true;
    } else {
      nextPage = false;
      notifyListeners();
      return false;
    }
  }

  bool canPreviusPage(int actualPage) {
    if (actualPage > 2) {
      previusPage = true;
      return true;
    } else {
      previusPage = false;
      notifyListeners();
      return false;
    }
  }
}
