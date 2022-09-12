import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: LineChart(
        LineChartData(
          lineBarsData: [LineChartBarData()],
          betweenBarsData: [],
          titlesData: FlTitlesData(),
          extraLinesData: ExtraLinesData(),
          lineTouchData: LineTouchData(),
          rangeAnnotations: RangeAnnotations(),
          showingTooltipIndicators: [],
          gridData: FlGridData(),
          borderData: FlBorderData(),
          minX: 0,
          maxX: 3,
          baselineX: 3,
          minY: 0,
          maxY: 3,
          baselineY: 3,
          clipData: FlClipData.none(),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
