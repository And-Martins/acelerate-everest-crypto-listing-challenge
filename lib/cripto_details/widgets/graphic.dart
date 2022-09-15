import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../list_cripto_currency.dart';

class Graphic extends StatelessWidget {
  const Graphic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> teste = listCriptoCurrency();
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                barWidth: 3.5,
                color: const Color.fromRGBO(224, 43, 87, 1),
                dotData: FlDotData(show: false),
                spots: [
                  teste[0],
                  teste[1],
                  teste[2],
                  teste[3],
                  teste[4],
                  teste[5],
                  teste[6],
                  teste[7],
                  teste[8],
                  teste[9],
                  teste[10],
                ],
              ),
            ],
            betweenBarsData: [],
            titlesData: FlTitlesData(show: false),
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(enabled: true),
            rangeAnnotations: RangeAnnotations(),
            showingTooltipIndicators: [],
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(
                  width: 3,
                  color: Color.fromRGBO(227, 228, 235, 1),
                ),
              ),
            ),
            minX: 0,
            maxX: 10,
            baselineX: 3,
            minY: 0,
            maxY: 15,
            baselineY: 3,
            clipData: FlClipData.none(),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}
