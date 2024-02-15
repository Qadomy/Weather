import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  final double? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  final double? tempF;
  final double? isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  final double? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? humidity;
  final double? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;
  final double? gustMph;
  final double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
