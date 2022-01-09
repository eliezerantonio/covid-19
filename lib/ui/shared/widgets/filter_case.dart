import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/shared/widgets/drown_states.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FilterCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      children: [
        Row(
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
              child: const Text("Brazil", style: TextStyle(fontSize: 20)),
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
                icon: const Icon(Icons.calendar_today))
          ],
        ),
      ],
    );
  }

  Future<void> calendar(BuildContext context) async {
    // FocusScope.of(context).requestFocus(new FocusNode());
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020,  3, 7),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final date = DateFormat('yyyy-MM-dd').format(picked);
      context.read<CasesProvider>().search(date: date);
    }
  }
}
