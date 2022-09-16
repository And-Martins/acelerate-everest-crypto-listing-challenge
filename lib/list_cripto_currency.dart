import 'dart:math';

import 'package:crypto_listing/shared/widgets/number_formatter.dart';
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
  for (var i = 0; i < 90; i++) {
    print(formatReais.format(spots[i].y));
  }

  return spots;
}

List<FlSpot> listCriptoCurrencyChangeDay(double dias) {
  final List<FlSpot> newSpots = [];

  for (var i = 0; i < dias; i++) {
    spots[i] = newSpots[i];
  }

  return newSpots;
}

void cleanListCriptoCurrency() {
  spots = [];
}
