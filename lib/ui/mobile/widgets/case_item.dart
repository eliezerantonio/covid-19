import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/ui/mobile/screens/case_screen.dart';
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
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
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
          padding: EdgeInsets.all(responsive.wp(3)),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(result.state!),
              SizedBox(
                width: responsive.wp(10),
              ),
              Text(result.confirmed!.toString()),
              SizedBox(
                width: responsive.wp(7),
              ),
              Text(result.deaths.toString()),
              SizedBox(
                width: responsive.wp(7),
              ),
              Text(result.deaths.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
