import 'package:covid_19_cases/ui/screens/shared/screen/login_screen/widgets/login_card.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/forms.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(child: (size.width > 559) ? web(size) : mobile(size)),
    );
  }

  Widget mobile(size) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    );
  }

  Widget web(size) {
    return Row(
      children: [
        Container(
          color: Color(MyColors.primaryColor),
          width: size.width * 0.4,
          child: Center(child: Image.asset("assets/virus.gif")),
        ),
        Container(
          width: size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CardLogin(),
            ],
          ),
        ),
      ],
    );
  }
}
