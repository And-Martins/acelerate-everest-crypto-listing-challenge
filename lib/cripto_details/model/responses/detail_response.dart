import 'package:json_annotation/json_annotation.dart';

part 'detail_response.g.dart';

@JsonSerializable()
class DetailResponse {
  final List<List<double>> prices;
  DetailResponse({
    required this.prices,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseToJson(this);
}
