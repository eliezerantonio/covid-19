import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class GeralCasesWidget extends StatelessWidget {
  const GeralCasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    Column newMethod(String type, int quantity) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: const TextStyle(
              color: Colors.white60,
            ),
          ),
          SizedBox(
            height: responsive.hp(0.7),
          ),
          Text(
            quantity.toString(),
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Container(
      alignment: Alignment.center,
      height: responsive.hp(10),
      width: responsive.wp(100),
      decoration: BoxDecoration(
        color: Color(MyColors.primaryColor),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          newMethod("Confirmados", 234221),
          newMethod("Recuperados", 234221),
          newMethod("Mortos", 234221),
        ],
      ),
    );
  }
}
