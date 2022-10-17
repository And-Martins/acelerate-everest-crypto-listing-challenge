import 'days_model.dart';

class PricesModel {
  final String latest;
  final Day day;
  PricesModel({
    required this.latest,
    required this.day,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'latest': latest});
    result.addAll({'day': day.toMap()});

    return result;
  }

  factory PricesModel.fromMap(Map<String, dynamic> map) {
    return PricesModel(
      latest: map['latest'] ?? '',
      day: Day.fromMap(map['day']),
    );
  }
}
