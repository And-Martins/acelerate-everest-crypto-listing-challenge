import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  const Graphic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const FlSpot(0, 0),
                    const FlSpot(2, 2),
                    const FlSpot(3, 3),
                    const FlSpot(5, 2),
                    const FlSpot(6, 4),
                    const FlSpot(7, 5),
                    const FlSpot(8, 5),
                    const FlSpot(9, 6),
                    const FlSpot(10, 9),
                  ])
            ],
            betweenBarsData: [],
            titlesData: FlTitlesData(show: false),
            extraLinesData: ExtraLinesData(),
            lineTouchData: LineTouchData(),
            rangeAnnotations: RangeAnnotations(),
            showingTooltipIndicators: [],
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
                border: const Border(
              bottom: BorderSide(
                width: 3,
                color: Color.fromRGBO(227, 228, 235, 1),
              ),
            )),
            minX: 0,
            maxX: 10,
            baselineX: 3,
            minY: 0,
            maxY: 15,
            baselineY: 3,
            clipData: FlClipData.none(),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
