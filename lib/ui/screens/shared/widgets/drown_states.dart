import 'package:covid_19_cases/providers/cases_provider.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrownStates extends StatefulWidget {
  @override
  State<DrownStates> createState() => _DrownStatesState();
}

class _DrownStatesState extends State<DrownStates> {
  String dropdownValue = 'AL';

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return DropdownButton<String>(
      menuMaxHeight: 200,
      value: dropdownValue,
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Colors.grey[200],
      elevation: 8,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;

          //filtrando por estado

          context.read<CasesProvider>().search(state: newValue);
        });
      },
      items: <String>[
        'AL',
        'AM',
        'AP',
        'BA',
        'CE',
        'DF',
        'ES',
        'GO',
        'MA',
        'MG',
        'MT',
        'PA',
        'PB',
        'PE',
        'PI',
        'PR',
        'RJ',
        'RO',
        'RS',
        'SC',
        'SE',
        'SP',
        'AC',
        'MS',
        'RN',
        'RR',
        'TO'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: responsive.hp(7),
            height: responsive.hp(7),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            child: Text(
              value,
            ),
          ),
        );
      }).toList(),
    );
  }
}
