import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_cases/models/result.dart';

class CaseItem extends StatelessWidget {
  const CaseItem({
    Key? key,
    required this.responsive,
    required this.result,
  }) : super(key: key);

  final Responsive responsive;
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(3)),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(result.state),
          SizedBox(
            width: responsive.wp(10),
          ),
          const Text("Confirmados"),
          SizedBox(
            width: responsive.wp(7),
          ),
          const Text("Mortos"),
          SizedBox(
            width: responsive.wp(7),
          ),
          const Text("Estado"),
        ],
      ),
    );
  }
}
