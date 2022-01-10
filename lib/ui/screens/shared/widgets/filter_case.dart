import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/drown_states.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FilterCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final actualPage = context.watch<CasesProvider>().actualPage;
    return Wrap(
      children: [
        Container(
          width: 100,
          height: responsive.hp(7),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text("Brasil", style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(
          width: 7,
        ),
        DrownStates(),
        const SizedBox(
          width: 7,
        ),
        IconButton(
          onPressed: () {
            calendar(context);
          },
          icon: const Icon(Icons.calendar_today),
        ),
        TextButton(
          onPressed: () {
            context.read<CasesProvider>().getCases();
          },
          child: const Text("Voltar Para Página  1"),
        ),
        SizedBox(
          width: responsive.wp(2),
        ),
        Consumer<CasesProvider>(builder: (_, casesProvider, __) {
          return IconButton(
            onPressed: casesProvider.actualPage > 2
                ? () {
                    context.read<CasesProvider>().getCasesPreviusPage();
                  }
                : null,
            icon: const Icon(Icons.navigate_before),
          );
        }),
        SizedBox(
          width: responsive.wp(2),
        ),
        Consumer<CasesProvider>(builder: (_, casesProvider, __) {
          return IconButton(
            onPressed: casesProvider.actualPage < 24
                ? () {
                    context.read<CasesProvider>().getCasesNextPage();
                  }
                : null,
            icon: const Icon(Icons.navigate_next),
          );
        }),
        SizedBox(
          width: responsive.wp(2),
        ),
        Text("Página  atual ${actualPage - 1}")
      ],
    );
  }

  Future<void> calendar(BuildContext context) async {
    // FocusScope.of(context).requestFocus(new FocusNode());
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 3, 7),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final date = DateFormat('yyyy-MM-dd').format(picked);
      context.read<CasesProvider>().search(date: date);
    }
  }
}
