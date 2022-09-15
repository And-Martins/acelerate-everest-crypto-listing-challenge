import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

List<FlSpot> listCriptoCurrency() {
  final List<double> yValues = [];

  var val = Random();
  for (var i = 0; i < 90; i++) {
    yValues.add(val.nextDouble() * 10);
  }

  List<FlSpot> spots = yValues.asMap().entries.map((e) {
    return FlSpot(e.key.toDouble(), e.value);
  }).toList();

  for (var i = 0; i < 90; i++) {
    print(spots[i]);
  }

  return spots;
}
