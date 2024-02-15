import 'package:json_annotation/json_annotation.dart';

import 'forecastday.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
