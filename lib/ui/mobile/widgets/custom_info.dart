import 'package:covid_19_cases/ui/mobile/widgets/item_info.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemInfo(
              responsive: responsive,
              text: 'Hospital',
              iconData: Icons.medical_services,
              color: Colors.purple[300]!,
            ),
            SizedBox(
              width: responsive.wp(5),
            ),
            ItemInfo(
              responsive: responsive,
              text: 'Hospital',
              iconData: Icons.medical_services,
              color: Colors.yellow[300]!,
            ),
          ],
        ),
        SizedBox(
          height: responsive.hp(3),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemInfo(
              responsive: responsive,
              text: 'Hospital',
              iconData: Icons.medical_services,
              color: Colors.green[300]!,
            ),
            SizedBox(
              width: responsive.wp(5),
            ),
            ItemInfo(
              responsive: responsive,
              text: 'Hospital',
              iconData: Icons.medical_services,
              color: Colors.blue[300]!,
            ),
          ],
        )
      ],
    );
  }
}
