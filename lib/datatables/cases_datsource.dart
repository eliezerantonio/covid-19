import 'package:covid_19_cases/models/result.dart';
import 'package:flutter/material.dart';

class CasesDTS extends DataTableSource {
  CasesDTS(this.cases, this.context);
  final List<Result> cases;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    final caseCovid = cases[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(caseCovid.state.toString())),
      DataCell(Text(caseCovid.confirmed.toString())),
      DataCell(Text(caseCovid.estimatedPopulation.toString())),
      DataCell(Text(caseCovid.deaths.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => cases.length;

  @override
  int get selectedRowCount => 0;
}
