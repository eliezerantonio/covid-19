import 'package:covid_19_cases/datatables/cases_datsource.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/ui/mobile/widgets/header_case.dart';
import 'package:covid_19_cases/ui/shared/widgets/filter_case.dart';
import 'package:covid_19_cases/ui/shared/widgets/header_updates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebHomeScreen extends StatefulWidget {
  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final cases = context.watch<CasesProvider>().cases;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          CovidText(),
          const SizedBox(
            height: 30,
          ),
          FilterCase(),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: [
              DataColumn(
                label: Column(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.6),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.remove,
                          size: 15, color: Colors.orange),
                    ),
                    const Text("Estado"),
                  ],
                ),
              ),
              const DataColumn(
                label: HeaderCase(
                  color: Colors.blue,
                  text: 'Confirmados',
                ),
              ),
              const DataColumn(
                label: HeaderCase(
                  color: Colors.green,
                  text: 'População',
                ),
              ),
              const DataColumn(
                label: HeaderCase(
                  color: Colors.red,
                  text: 'Mortos',
                ),
              ),
              const DataColumn(
                label: Text("Ver")
              ),
            ],
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value!;
              });
            },
            source: CasesDTS(cases, context),
            header: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: HeaderUpdates(),
              ),
            ),
            rowsPerPage: _rowsPerPage,
          ),
        ],
      ),
    );
  }
}
