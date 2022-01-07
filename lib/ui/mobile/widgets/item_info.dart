import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.responsive,
    required this.text,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final Responsive responsive;
  final String text;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: responsive.hp(10),
        width: responsive.wp(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[100]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: responsive.hp(7),
              width: responsive.wp(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            SizedBox(width: responsive.wp(2)),
            Text(
              "Hospital",
              style: TextStyle(
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ));
  }
}
