import '../../features/home/data/models/weather_model.dart';

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String detailsView = '/details_view';
}

class ScreenArguments {
  final String? cityName;
  final WeatherModel? weatherModel;

  ScreenArguments({
    this.cityName,
    this.weatherModel,
  });
}