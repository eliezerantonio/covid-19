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
        const Text("Estado"),
        SizedBox(
          width: responsive.wp(10),
        ),
        const Text("Confirmados"),
        SizedBox(
          width: responsive.wp(7),
        ),
        const Text("Recuperados"),
        SizedBox(
          width: responsive.wp(7),
        ),
        const Text("Mortos"),
      ],
    );
  }
}
