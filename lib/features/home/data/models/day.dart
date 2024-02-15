import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final double? avghumidity;
  final double? dailyWillItRain;
  final double? dailyChanceOfRain;
  final double? dailyWillItSnow;
  final double? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempF,
    this.avgtempC,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
