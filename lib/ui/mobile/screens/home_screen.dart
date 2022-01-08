// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/ui/mobile/widgets/case_item.dart';
import 'package:covid_19_cases/ui/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/ui/shared/widgets/drown_states.dart';
import 'package:covid_19_cases/ui/shared/widgets/filter_case.dart';
import 'package:covid_19_cases/ui/mobile/widgets/header_list_cases.dart';
import 'package:covid_19_cases/ui/shared/widgets/header_updates.dart';
import 'package:covid_19_cases/ui/web/home_view.dart';
import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final cases = context.watch<CasesProvider>().cases;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: HomeView(cases),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          );
        },
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.blue[900]!.withOpacity(0.7),
              shape: BoxShape.circle),
          child: const Icon(Icons.arrow_upward_outlined,
              size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required ScrollController scrollController,
    required this.responsive,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      children: [
        CovidText(),
        const SizedBox(
          height: 30,
        ),
        FilterCase(responsive: responsive),
        const SizedBox(
          height: 10,
        ),
        HeaderUpdates(),
        const SizedBox(
          height: 10,
        ),
        HeaderListCases(responsive: responsive),
        const SizedBox(height: 10),

        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: cases.length,
        //   itemBuilder: (context, index) => Column(
        //     children: [
        //       FadeInLeft(child: CaseItem(responsive: responsive, result: cases[index])),
        //       const SizedBox(height: 10),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
