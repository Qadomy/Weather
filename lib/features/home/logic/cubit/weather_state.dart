import 'package:weather_warba_bank/features/home/data/models/weather_model.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherByCityNameInitialState extends WeatherState {}

class WeatherByCityNameLoadingState extends WeatherState {}

class WeatherByCityNameSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherByCityNameSuccessState(this.weatherModel);
}

class WeatherByCityNameFailureState extends WeatherState {
  final String error;

  const WeatherByCityNameFailureState(this.error);
}
