import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_warba_bank/features/home/view/widgets/details_screen_body.dart';
import 'package:weather_warba_bank/features/home/view/widgets/error_screen.dart';

import '../data/models/weather_model.dart';
import '../logic/cubit/weather_cubit.dart';
import '../logic/cubit/weather_state.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.cityName, this.weatherModel});

  final String? cityName;
  final WeatherModel? weatherModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    if (widget.cityName!.isNotEmpty) {
      WeatherCubit.get(context)
          .fetchWeatherByCityName(cityName: widget.cityName!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state) {
            case WeatherByCityNameSuccessState():
              return DetailsScreenBody(
                weatherModel: state.weatherModel,
              );
            case WeatherByCityNameFailureState():
              return ErrorScreen(
                error: state.error,
              );
            case WeatherByCityNameLoadingState():
              return const Center(
                child: CircularProgressIndicator(
                    color: Colors.black), // The loading indicator
              );

            default:
              return DetailsScreenBody(
                weatherModel: widget.weatherModel!,
              );
          }
        },
      ),
    );
  }
}
