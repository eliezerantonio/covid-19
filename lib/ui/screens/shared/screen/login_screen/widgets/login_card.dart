
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bem vindo',
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 36, color: Color(MyColors.primaryColor)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Forms(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}