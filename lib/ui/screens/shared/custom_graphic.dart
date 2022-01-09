import 'package:covid_19_cases/utils/my_colors.dart';
import 'package:covid_19_cases/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomGraphic extends StatelessWidget {
  CustomGraphic(this.datasGrap);
  final List<Map<String, Object?>> datasGrap;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        width: responsive.wp(kIsWeb ? 60 : 76),
        height: 300,
        child: Chart(
          data: datasGrap,
          variables: {
            'genre': Variable(
              accessor: (Map map) => map['genre'] as String,
            ),
            'sold': Variable(
              accessor: (Map map) => map['sold'] as num,
            ),
          },
          elements: [
            IntervalElement(
              label: LabelAttr(
                  encoder: (tuple) => Label(tuple['sold'].toString())),
              elevation: ElevationAttr(value: 0, onSelection: {
                'tap': {true: (_) => 5}
              }),
              color:
                  ColorAttr(value: Color(MyColors.primaryColor), onSelection: {
                'tap': {false: (color) => color.withAlpha(100)}
              }),
            )
          ],
          axes: [
            Defaults.horizontalAxis,
            Defaults.verticalAxis,
          ],
          selections: {'tap': PointSelection(dim: Dim.x)},
          tooltip: TooltipGuide(),
          crosshair: CrosshairGuide(),
        ),
      ),
    );
  }
}
