import 'package:covid_19_cases/models/result.dart';
import 'package:flutter/material.dart';

class NumberCase extends StatelessWidget {
  const NumberCase({
    Key? key,
    required this.responsive,
    required this.result,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Responsive responsive;
  final Result result;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.wp(30),
      height: responsive.hp(18),
      color: Colors.grey[100],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color.withOpacity(0.4),
            child: const Icon(Icons.add, color: Colors.orange),
          ),
          SizedBox(height: responsive.hp(1)),
          Text(
            result.confirmed!.toString(),
            style: TextStyle(
                color: color, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: responsive.hp(1)),
          const Text(
            "Confirmados",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
