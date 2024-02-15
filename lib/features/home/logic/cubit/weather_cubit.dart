import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_warba_bank/features/home/data/viewmodel/home_view_model.dart';
import 'package:weather_warba_bank/features/home/logic/cubit/weather_state.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final HomeViewModel homeViewModel;

  WeatherCubit(this.homeViewModel) : super(WeatherByCityNameInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);

  Future<void> fetchWeatherByCityName({
    required String cityName,
  }) async {
    emit(WeatherByCityNameLoadingState());
    Either<Failure, WeatherModel> result =
    await homeViewModel.fetchWeatherByCityName(cityName: cityName);
    result.fold(
          (failure) {
        emit(WeatherByCityNameFailureState(failure.error));
      },
          (weather) {
        emit(WeatherByCityNameSuccessState(weather));
      },
    );
  }
}
