class Day {
  final double percentChange;
  final int yaxisScalingFactor;
  final List<double> pricesDay;
  Day({
    required this.percentChange,
    required this.yaxisScalingFactor,
    required this.pricesDay,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'percent_change': percentChange});
    result.addAll({'yaxis_scaling_factor': yaxisScalingFactor});
    result.addAll({'prices_day': pricesDay});

    return result;
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      percentChange: map['percent_change']?.toDouble() ?? 0.0,
      yaxisScalingFactor: map['yaxis_scaling_factor']?.toInt() ?? 0,
      pricesDay: map['prices_day'] ?? 0.0,
    );
  }
}
