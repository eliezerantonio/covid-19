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

  int actualPage = 2;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getCases() async {
    try {
      loading = true;
      final response = await CovidApi.httpGet("/");
      final casesResponse = CasesResponse.fromJson(response);

      cases = [...?casesResponse.results];

      actualPage = 2;
    } catch (e) {
      print("Error $e");
    } finally {
      loading = false;
    }
  }

  Future<void> getCasesNextPage() async {
    try {
      loading = true;
      final response = await CovidApi.httpGet("/?page=$actualPage");
      final casesResponse = CasesResponse.fromJson(response);

      cases = [...?casesResponse.results];
      actualPage++;
    } catch (e) {
      print("Error $e");
    } finally {
      loading = false;
    }
  }

  Future<void> getCasesPreviousPage() async {
    try {
      loading = true;
      final response = await CovidApi.httpGet("/?page=$actualPage");
      final casesResponse = CasesResponse.fromJson(response);

      cases = [...?casesResponse.results];
      actualPage--;
    } catch (e) {
      print("Error $e");
    } finally {
      loading = false;
    }
  }

  Future<void> search({String? state = "", String? date = ""}) async {
    try {
      loading = true;
      final response =
          await CovidApi.httpGet("/?search&date=$date&state=$state");
      final casesResponse = CasesResponse.fromJson(response);

      cases = [...?casesResponse.results];
    } catch (e) {
      print("Error $e");
    } finally {
      loading = false;
    }
  }
}
