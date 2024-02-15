import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_warba_bank/core/errors/failures.dart';
import 'package:weather_warba_bank/core/networking/api_service.dart';
import 'package:weather_warba_bank/features/home/data/models/weather_model.dart';
import 'package:weather_warba_bank/features/home/data/viewmodel/home_view_model_implementation.dart';

import 'weather_cubit_test.mocks.dart';

@GenerateMocks([ApiServices]) // List all classes to mock
void main() {
  late MockApiServices mockApiServices;
  late HomeViewModelImplementation viewModel;

  setUp(() {
    mockApiServices = MockApiServices();
    viewModel = HomeViewModelImplementation(mockApiServices);
  });

  group('fetchWeatherByCityName', () {
    const cityName = 'TestCity';
    final mockWeatherData = {
      "location": {
        "name": "TestCity",
        "country": "TestCountry",
      },
      "current": {
        "temp_c": 20.0,
      },
      "forecast": {
        "forecastday": [
          {
            "date": "2024-02-15",
            "day": {
              "maxtemp_c": 22.0,
              "mintemp_c": 18.0,
            },
          },
        ],
      },
    };

    test('should return WeatherModel on successful API call', () async {
      // Arrange
      when(mockApiServices.get(
        endPoint: anyNamed('endPoint'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => mockWeatherData);

      // Act
      final result = await viewModel.fetchWeatherByCityName(cityName: cityName);

      // Assert
      expect(result, isA<Right<Failure, WeatherModel>>());
      result.fold(
        (failure) => fail('Expected a WeatherModel, got a failure'),
        (weather) {
          expect(weather, isA<WeatherModel>());
          expect(weather.location?.name, equals('TestCity'));
        },
      );
    });

    test('should return Failure on API failure', () async {
      // Arrange
      when(mockApiServices.get(
        endPoint: anyNamed('endPoint'),
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(Exception('Failed to fetch weather'));

      // Act
      final result = await viewModel.fetchWeatherByCityName(cityName: cityName);

      // Assert
      expect(result, isA<Left<Failure, WeatherModel>>());
    });
  });
}
