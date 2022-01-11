import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/ui/screens/shared/screen/case_screen/case_screen.dart';

import 'package:flutter/material.dart';

class CasesDTS extends DataTableSource {
  CasesDTS(this.cases, this.context);
  final List<Result> cases;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    final caseCovid = cases[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(Result.getStateText(caseCovid.state!))),
      DataCell(Text(caseCovid.confirmed.toString())),
      DataCell(Text(caseCovid.estimatedPopulation.toString())),
      DataCell(Text(caseCovid.deaths.toString())),
      DataCell(
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CaseScreen(result: caseCovid),
              ),
            );
          },
          icon: const Icon(
            Icons.visibility,
            color: Colors.grey,
          ),
        ),
      )
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => cases.length;

  @override
  int get selectedRowCount => 0;
}
