import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/ui/screens/shared/screen/case_screen/case_screen.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_cases/models/result.dart';

class CaseItem extends StatelessWidget {
  const CaseItem({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return FadeInUp(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CaseScreen(result: result),
            ),
          );
        },
        child: Container(
          // width: responsive.wp(100),
          padding: EdgeInsets.only(
            right: responsive.wp(1),
            left: responsive.wp(1),
            top: responsive.hp(0.5),
            bottom: responsive.hp(0.5),
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Result.getStateText(result.state!)),

                Text(result.date.toString(),
                    style: TextStyle(color: Colors.grey))
              ],
            ),
            title: Center(child: Text(result.confirmed.toString())),
            trailing: Text(result.deaths.toString()),
          ),
        ),
      ),
    );
  }
}
