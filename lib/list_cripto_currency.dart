import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

List<FlSpot> spots = [];

List<FlSpot> listCriptoCurrency() {
  if (spots.isEmpty) {
    final List<double> yValues = [];

    var val = Random();
    for (var i = 0; i < 90; i++) {
      yValues
          .add(double.parse((val.nextDouble() * 103612.60).toStringAsFixed(2)));
    }

    spots = yValues.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();
  }

  return spots;
}

List<FlSpot> listCriptoCurrencyChangeDay(double dias) {
  List<FlSpot> newSpots = [];

  for (var i = 0; i < dias; i++) {
    newSpots.add(spots[i]);
  }

  return newSpots;
}

void cleanListCriptoCurrency() {
  spots = [];
}
