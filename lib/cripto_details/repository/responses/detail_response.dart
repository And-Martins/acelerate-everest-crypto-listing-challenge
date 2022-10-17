import 'package:json_annotation/json_annotation.dart';

part 'detail_response.g.dart';

@JsonSerializable()
class DetailResponse {
  final List<double> prices;
  DetailResponse({
    required this.prices,
  });

  factory DetailResponse.fromMap(Map<String, dynamic> map) {
    return DetailResponse(
      prices: map['prices']?.toDouble() ?? 0.0,
    );
  }

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);
}
