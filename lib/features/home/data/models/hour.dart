import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'hour.g.dart';

@JsonSerializable()
class Hour {
  final double? timeEpoch;
  final String? time;
  final double? tempC;
  final double? tempF;
  final double? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final double? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? snowCm;
  final double? humidity;
  final double? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final double? willItRain;
  final double? chanceOfRain;
  final double? willItSnow;
  final double? chanceOfSnow;
  final double? visKm;
  final double? visMiles;
  final double? gustMph;
  final double? gustKph;
  final double? uv;
  final double? shortRad;
  final double? diffRad;

  Hour({
    this.timeEpoch,
    this.time,
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
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.shortRad,
    this.diffRad,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
