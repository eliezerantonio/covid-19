import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/ui/screens/mobile/widgets/header_case.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderListCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInLeft(
          child: const HeaderCase(
            color: Colors.orange,
            text: 'Estado',
          ),
        ),
        SizedBox(
          width: responsive.wp(10),
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: const HeaderCase(
            color: Colors.blue,
            text: 'Confirmados',
          ),
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 1200),
          child: const HeaderCase(
            color: Colors.green,
            text: 'População',
          ),
        ),
        SizedBox(
          width: responsive.wp(7),
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: const HeaderCase(
            color: Colors.red,
            text: 'Mortos',
          ),
        ),
      ],
    );
  }
}
