import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/header_case.dart';

class HeaderListCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return FadeInUpBig(
      child: const ListTile(
        dense: true,
        leading: HeaderCase(
          color: Colors.orange,
          text: 'Estado',
        ),
        title: HeaderCase(
          color: Colors.blue,
          text: 'Confirmados',
        ),
        trailing: HeaderCase(
          color: Colors.red,
          text: 'Mortos',
        ),
        subtitle: Text(""),
      ),
    );
  }
}
