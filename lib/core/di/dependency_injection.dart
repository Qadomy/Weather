import 'package:get_it/get_it.dart';
import 'package:weather_warba_bank/core/networking/dio_factory.dart';
import 'package:weather_warba_bank/features/home/data/viewmodel/home_view_model_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioFactory>(DioFactory());
  getIt.registerSingleton<HomeViewModelImplementation>(
      HomeViewModelImplementation(getIt.get<DioFactory>()));
}
