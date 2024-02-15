import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_warba_bank/core/routing/routes.dart';
import 'package:weather_warba_bank/features/home/data/viewmodel/home_view_model_implementation.dart';
import 'package:weather_warba_bank/features/home/logic/cubit/weather_cubit.dart';
import 'package:weather_warba_bank/features/home/view/details_screen.dart';

import '../../features/home/data/models/weather_model.dart';
import '../../features/home/view/home_screen.dart';
import '../animations/page_fade_transition.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => WeatherCubit(
              getIt.get<HomeViewModelImplementation>(),
            ),
            child: const HomeScreen(),
          ),
        );
      case Routes.detailsView:
        final arguments = settings.arguments as ScreenArguments?;
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => WeatherCubit(
              getIt.get<HomeViewModelImplementation>(),
            ),
            child: DetailsScreen(
              cityName: arguments!.cityName ?? '',
              weatherModel: arguments.weatherModel ?? WeatherModel(),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
