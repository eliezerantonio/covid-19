import 'package:covid_19_cases/ui/shared/widgets/drown_states.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

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
            DrownStates()
          ],
        ),
      ],
    );
  }
}
