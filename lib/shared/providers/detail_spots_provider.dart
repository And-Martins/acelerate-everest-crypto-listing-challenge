import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getSpotsStateNotifierProvider =
    StateNotifierProvider<DetailSpotsProvider, Map<String, List<FlSpot>>>(
  (ref) => DetailSpotsProvider(),
);

class DetailSpotsProvider extends StateNotifier<Map<String, List<FlSpot>>> {
  DetailSpotsProvider() : super({});

  Map<String, List<FlSpot>> getSpots(List<double> values) {
    double count = 0;
    List<FlSpot> d90 = values
        .map<FlSpot>(
          (value) => FlSpot(
            count++,
            double.parse(
              value.toStringAsFixed(2),
            ),
          ),
        )
        .toList();
    return {
      "5D": d90
          .sublist(d90.length - 5, d90.length)
          .map(
            (e) => FlSpot(e.x - (d90.length - 5), e.y),
          )
          .toList(),
      "15D": d90
          .sublist(d90.length - 15, d90.length)
          .map(
            (e) => FlSpot(e.x - (d90.length - 15), e.y),
          )
          .toList(),
      "30D": d90
          .sublist(d90.length - 30, d90.length)
          .map(
            (e) => FlSpot(e.x - (d90.length - 30), e.y),
          )
          .toList(),
      "45D": d90
          .sublist(d90.length - 45, d90.length)
          .map(
            (e) => FlSpot(e.x - (d90.length - 45), e.y),
          )
          .toList(),
      "90D": d90
          .sublist(d90.length - 90, d90.length)
          .map(
            (e) => FlSpot(e.x - (d90.length - 90), e.y),
          )
          .toList(),
    };
  }
}
