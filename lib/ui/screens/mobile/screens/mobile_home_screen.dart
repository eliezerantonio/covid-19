import 'package:animate_do/animate_do.dart';
import 'package:covid_19_cases/models/result.dart';
import 'package:covid_19_cases/providers/cases_provider.dart';

import 'package:covid_19_cases/ui/screens/shared/widgets/covid_text.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/filter_case.dart';
import 'package:covid_19_cases/ui/screens/shared/widgets/header_updates.dart';

import 'package:covid_19_cases/utils/my_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/case_item.dart';
import 'widgets/header_list_cases.dart';

class MobileHomeScreen extends StatefulWidget {
  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cases = context.watch<CasesProvider>().cases;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        children: [
          Consumer<CasesProvider>(builder: (_, casesProvider, __) {
            return casesProvider.loading
                ? LinearProgressIndicator(
                    color: Color(MyColors.primaryColor),
                  )
                : Container();
          }),
          CovidText(),
          const SizedBox(
            height: 30,
          ),
          FilterCase(),
          const SizedBox(
            height: 10,
          ),
          HeaderUpdates(),
          const SizedBox(
            height: 10,
          ),
          HeaderListCases(),
          const SizedBox(height: 10),
          _listViewCases(cases)
        ],
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  IconButton _floatingActionButton() {
    return IconButton(
      onPressed: () {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
      },
      icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.blue[900]!.withOpacity(0.7), shape: BoxShape.circle),
        child: const Icon(Icons.arrow_upward_outlined,
            size: 30, color: Colors.white),
      ),
    );
  }

  ListView _listViewCases(List<Result> cases) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cases.length,
        itemBuilder: (context, index) {
          if (cases.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                CaseItem(result: cases[index]),
                const SizedBox(height: 10),
              ],
            );
          }
        });
  }
}
