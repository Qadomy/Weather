import 'package:json_annotation/json_annotation.dart';

import 'astro.dart';
import 'day.dart';
import 'hour.dart';

part 'forecastday.g.dart';

@JsonSerializable()
class Forecastday {
  final DateTime? date;
  final double? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);
}
