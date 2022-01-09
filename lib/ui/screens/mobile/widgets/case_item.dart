import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/ui/screens/shared/screen/case_screen.dart';
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
    return FadeIn(
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
          padding: EdgeInsets.all(responsive.wp(2)),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Result.getStateText(result.state!),
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),
              SizedBox(
                width: responsive.wp(10),
              ),
              Text(
                result.confirmed!.toString(),
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),
              SizedBox(
                width: responsive.wp(7),
              ),
              Text(
                result.deaths.toString(),
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),
              SizedBox(
                width: responsive.wp(7),
              ),
              Text(
                result.deaths.toString(),
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
