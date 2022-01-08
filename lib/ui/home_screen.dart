// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/ui/shared/widgets/filter_case.dart';
import 'package:covid_19_cases/ui/mobile/widgets/header_list_cases.dart';
import 'package:covid_19_cases/ui/shared/widgets/header_updates.dart';
import 'package:covid_19_cases/ui/web/web_home_screen.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: WebHomeScreen(),
        ),
      ),
     
    );
  }
}
