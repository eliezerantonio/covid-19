import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class NumberCase extends StatelessWidget {
  const NumberCase({
    Key? key,
    required this.responsive,
    required this.number,
    required this.color,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  final Responsive responsive;
  final int number;
  final Color color;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive.wp(28),
      height: responsive.hp(18),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: responsive.wp(7),
            height: responsive.hp(7),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2), shape: BoxShape.circle),
            child: Icon(iconData, color: color, size: 20),
          ),
          SizedBox(height: responsive.hp(1)),
          Text(
            number.toString(),
            style: TextStyle(
                color: color, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: responsive.hp(1)),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
