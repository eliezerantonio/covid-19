import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:flutter/material.dart';

import 'forms.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: 400,
        height: 500,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      child: Center(
                        child: Image.asset(
                          "assets/contamin.gif",
                          width: 200,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CovidText(),
                    const SizedBox(
                      height: 20,
                    ),
                    Forms(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
