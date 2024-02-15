// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecastday _$ForecastdayFromJson(Map<String, dynamic> json) => Forecastday(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateEpoch: (json['dateEpoch'] as num?)?.toDouble(),
      day: json['day'] == null
          ? null
          : Day.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : Astro.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayToJson(Forecastday instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'dateEpoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
