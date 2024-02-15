import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/weather_model.dart';

abstract class HomeViewModel {
  Future<Either<Failure, WeatherModel>> fetchWeatherByCityName({
    required String cityName,
  });
}
