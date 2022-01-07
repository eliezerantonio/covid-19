import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';

class CaseScreen extends StatelessWidget {
  const CaseScreen({Key? key, required this.result}) : super(key: key);
  final Result result;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Estado currente",
                style: TextStyle(fontSize: responsive.dp(2)),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Text(
                result.state!,
                style: TextStyle(
                  fontSize: responsive.dp(5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Text(
                result.date!,
                style: TextStyle(
                  fontSize: responsive.dp(2),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Container(
                height: responsive.hp(10),
                width: responsive.wp(100),
                alignment: Alignment.center,
                child: const Text("Covid-19 Ultimas Atualizacoes",
                    style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  color: Color(MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Text(
                "Populacao estimada: ${result.estimatedPopulation}",
                style: TextStyle(
                  fontSize: responsive.dp(2),
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Text(
                "Populacao estimada 2019: ${result.estimatedPopulation2019}",
                style:
                    TextStyle(fontSize: responsive.dp(2), color: Colors.grey),
              ),
              SizedBox(height: responsive.dp(2)),
              NumberCase(
                  responsive: responsive,
                  result: result,
                  text: "Confirmados",
                  color: Colors.orange)
            ],
          ),
        ),
      ),
    );
  }
}

