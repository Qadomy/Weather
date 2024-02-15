// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      lastUpdatedEpoch: (json['lastUpdatedEpoch'] as num?)?.toDouble(),
      lastUpdated: json['last_updated'] as String?,
      tempC: (json['temp_c'] as num?)?.toDouble(),
      tempF: (json['tempF'] as num?)?.toDouble(),
      isDay: (json['isDay'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      windDegree: (json['windDegree'] as num?)?.toDouble(),
      windDir: json['windDir'] as String?,
      pressureMb: (json['pressureMb'] as num?)?.toDouble(),
      pressureIn: (json['pressureIn'] as num?)?.toDouble(),
      precipMm: (json['precipMm'] as num?)?.toDouble(),
      precipIn: (json['precipIn'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      cloud: (json['cloud'] as num?)?.toDouble(),
      feelslikeC: (json['feelslikeC'] as num?)?.toDouble(),
      feelslikeF: (json['feelslikeF'] as num?)?.toDouble(),
      visKm: (json['visKm'] as num?)?.toDouble(),
      visMiles: (json['visMiles'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      gustMph: (json['gustMph'] as num?)?.toDouble(),
      gustKph: (json['gustKph'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'lastUpdatedEpoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'tempF': instance.tempF,
      'isDay': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'pressureMb': instance.pressureMb,
      'pressureIn': instance.pressureIn,
      'precipMm': instance.precipMm,
      'precipIn': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslikeC': instance.feelslikeC,
      'feelslikeF': instance.feelslikeF,
      'visKm': instance.visKm,
      'visMiles': instance.visMiles,
      'uv': instance.uv,
      'gustMph': instance.gustMph,
      'gustKph': instance.gustKph,
    };
