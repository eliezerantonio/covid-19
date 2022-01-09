import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/ui/screens/mobile/widgets/number_cases.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class CasesItem extends StatelessWidget {
  const CasesItem({
    Key? key,
    required this.responsive,
    required this.result,
  }) : super(key: key);

  final Responsive responsive;
  final Result result;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(child: (size.width > 354) ? web() : mobile());
  }

//big screen
  Row web() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberCase(
          responsive: responsive,
          number: result.confirmed!,
          iconData: Icons.add,
          text: "Confirmados",
          color: Colors.orange,
        ),
        SizedBox(width: responsive.dp(2)),
        NumberCase(
          responsive: responsive,
          number: result.estimatedPopulation!,
          iconData: Icons.favorite,
          text: "População",
          color: Colors.green,
        ),
        SizedBox(width: responsive.dp(2)),
        NumberCase(
          responsive: responsive,
          number: result.deaths!,
          iconData: Icons.close,
          text: "Mortos",
          color: Colors.red,
        ),
      ],
    );
  }

//small screen
  Widget mobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberCase(
            responsive: responsive,
            number: result.confirmed!,
            iconData: Icons.add,
            text: "Confirmados",
            color: Colors.orange,
          ),
          SizedBox(height: responsive.dp(2)),
          NumberCase(
            responsive: responsive,
            number: result.estimatedPopulation!,
            iconData: Icons.favorite,
            text: "Populacao",
            color: Colors.green,
          ),
          SizedBox(height: responsive.dp(2)),
          NumberCase(
            responsive: responsive,
            number: result.deaths!,
            iconData: Icons.close,
            text: "Mortos",
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
