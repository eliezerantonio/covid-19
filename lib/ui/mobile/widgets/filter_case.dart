import 'package:covid_19_cases/ui/mobile/widgets/drown_states.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class FilterCase extends StatelessWidget {
  const FilterCase({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
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
