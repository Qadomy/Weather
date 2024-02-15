import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
