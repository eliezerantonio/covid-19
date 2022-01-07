import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderListCases extends StatelessWidget {
  const HeaderListCases({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.6),
                  shape: BoxShape.circle),
              child: const Icon(Icons.remove, size: 15, color: Colors.orange),
            ),
            const Text("Estado"),
          ],
        ),
        SizedBox(
          width: responsive.wp(10),
        ),
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.blue[900]!.withOpacity(0.6),
                  shape: BoxShape.circle),
              child: Icon(Icons.remove, size: 15, color: Colors.blue[900]!),
            ),
            const Text("Confirmados"),
          ],
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.6), shape: BoxShape.circle),
              child: const Icon(Icons.remove, size: 15, color: Colors.green),
            ),
            const Text("Recuperados"),
          ],
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.6), shape: BoxShape.circle),
              child: const Icon(Icons.remove, size: 15, color: Colors.red),
            ),
            const Text("Mortos"),
          ],
        ),
      ],
    );
  }
}
