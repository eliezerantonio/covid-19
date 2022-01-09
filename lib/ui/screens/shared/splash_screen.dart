import 'package:covid_19_cases/ui/screens/home_screen.dart';
import 'package:covid_19_cases/ui/screens/login_screen.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SplashScreenView(
      navigateRoute: LoginScreen(),
      duration: 2000,
      imageSize: 400,
      imageSrc: "assets/medicos.png",
      backgroundColor: Colors.white,
    );
  }
}
