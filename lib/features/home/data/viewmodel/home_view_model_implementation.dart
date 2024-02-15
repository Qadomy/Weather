import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_warba_bank/core/networking/api_constants.dart';
import 'package:weather_warba_bank/features/home/data/viewmodel/home_view_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/networking/api_service.dart';
import '../models/weather_model.dart';

class HomeViewModelImplementation implements HomeViewModel {
  final ApiServices apiServices;

  const HomeViewModelImplementation(this.apiServices);

  @override
  Future<Either<Failure, WeatherModel>> fetchWeatherByCityName(
      {required String cityName}) async {
    try {
      Map<String, dynamic> data = await apiServices.get(
        endPoint: ApiConstants.forecast,
        queryParameters: {
          'q': cityName,
          'key': ApiConstants.apiKey,
          'days': 3,
        },
      );
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return Right(weatherModel);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
