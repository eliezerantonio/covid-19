import 'package:covid_19_cases/ui/mobile/widgets/header_case.dart';
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
        const HeaderCase(
          color: Colors.orange,
          text: 'Estado',
        ),
        SizedBox(
          width: responsive.wp(10),
        ),
        const HeaderCase(
          color: Colors.blue,
          text: 'Confirmados',
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
        const HeaderCase(
          color: Colors.green,
          text: 'População',
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
         const HeaderCase(
          color: Colors.red,
          text: 'Mortos',
        ),
      ],
    );
  }
}
