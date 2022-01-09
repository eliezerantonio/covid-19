import 'package:covid_19_cases/ui/mobile/screens/mobile_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'web/web_home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          //abrindo telas para plataformas adequandas
          child: kIsWeb ? WebHomeScreen() : MobileHomeScreen(),
        ),
      ),
    );
  }
}
